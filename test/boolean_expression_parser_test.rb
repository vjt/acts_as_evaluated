require 'test/unit'
require 'boolean_expression_grammar'
require 'boolean_expression_tokenizer'
require 'boolean_expression_evaluator'
require 'fake_logger'

class Numeric
  def radians
    self * Math::PI / 180
  end
end

include Math

class TestBooleanExpressionParser < Test::Unit::TestCase
  def test_compilation_of_parser
    logger = FakeLogger.new
    parser = Dhaka::Parser.new(BooleanExpressionGrammar, logger)
    eval(parser.compile_to_ruby_source_as(:BooleanExpressionParser))

    assert_equal(34, logger.warnings.size)
    assert_equal(0, logger.errors.size)
  end

  def test_integer_expressions # !> private attribute?
    assert_correct_evaluation '5 * -14 / (2 * 7 - 7) + 2'
    assert_correct_evaluation '-2 ** 2'
    assert_correct_evaluation '2 + 2 ** 3'
    assert_correct_evaluation '(2 + 2) ** 3'
    assert_correct_evaluation '(2 + 2) ** 3 * 2'
  end

  def test_variables_reference
    assert_correct_evaluation '(2 + foo) * bar / 2',  'foo' => 4, 'bar' => 420
    assert_correct_evaluation 'foo + 2 + sqrt(bar) * log(baz)', 'foo' => Math::PI, 'bar' => 31, 'baz' => 3.7
  end

  def test_float_expressions
    assert_correct_evaluation '-5.0 + 1.0'
    assert_correct_evaluation '4.1 * 2 + 0.3'
    assert_correct_evaluation '0.3 + 3 * 2 ** 3 + 0.4'
  end

  def test_function_calls
    [2, 3, 7, 9, 12, 420, 4935].each do |num|
      %w(sqrt log).each do |func|
        assert_correct_evaluation "#{func}(#{num})"
      end
      %w(sin cos tan).each do |func|
        assert_equal(Math.send(func, num.radians), evaluate("#{func}(#{num})"))
      end
    end

    [0.2, 0.4, 0.83, 0.92, 0.11, 0.753].each do |num|
      %w(asin acos atan).each do |func|
        assert_correct_evaluation "#{func}(#{num})"
      end
    end
  end

  def test_some_boolean_expressions
    assert_correct_evaluation 'a * 45 + sin(14) >= 3 - log(45) or b == 2', 'a' => 5, 'b' => 2, 'c' => 34, 'd' => 1 
    assert_correct_evaluation 'a * d + cos(c) >= 3 - log(45) and b == 2', 'a' => 5, 'b' => 2, 'c' => 34, 'd' => 1
    assert_correct_evaluation '2 > 2'
    assert_correct_evaluation '2 == 2'
    assert_correct_evaluation '2 > 1 or 2 < 1'
    assert_correct_evaluation '2 > 1 and 2 < 1'
    assert_correct_evaluation '10 * 2 >= 4 + 0 * 2'
    assert_correct_evaluation 'true and false or true'
    assert_correct_evaluation 'true or false or true and false'
    assert_correct_evaluation 'true and false'
    assert_correct_evaluation 'true or false'
    assert_correct_evaluation 'false and true or false'
    assert_correct_evaluation 'true and false or true and true'
    assert_correct_evaluation '(true and false) or true'
    assert_correct_evaluation '(false or (true and false)) and (true or false)'
  end

  def test_parse_errors
    assert(tokenize("1.3.4 * 2").has_error?)
    assert(parse("(2+2)^3^2").has_error?)
    assert_raise(BooleanExpressionError) { evaluate("suxalot(4)") }
  end

  def test_the_array_inclusion
    assert_equal(true, evaluate("4 in arr", { "arr" => [1,2,3,4] }))
    assert_equal(false, evaluate("type in allowed_types", { "type" => 3, "allowed_types" => [1,2,5,6] }))
    assert_equal(false, evaluate("4 not in arr", { "arr" => [1,2,3,4] }))
    assert_equal(true, evaluate("type not in allowed_types", { "type" => 3, "allowed_types" => [1,2,5,6] }))
  end
  
  protected
  def tokenize(input)
    BooleanExpressionTokenizer.tokenize(input)
  end

  def parse(input)
    input = tokenize(input) if input.is_a? String
    assert_kind_of(Dhaka::TokenizerSuccessResult, input)
    BooleanExpressionParser.parse input
  end

  def evaluate(input, variables = {})
    input = parse(input) if input.is_a? String
    assert_kind_of(Dhaka::ParseSuccessResult, input)

    @_eval ||= BooleanExpressionEvaluator.new
    @_eval.variables = variables unless variables.empty?
    @_eval.evaluate input.parse_tree
  end

  # let's ask ruby itself if our computation is correct.. :)
  #
  def assert_correct_evaluation(*expressions)
    expr_variables = expressions.pop if expressions.last.is_a? Hash
    expr_variables ||= {}
    ruby_variables = expr_variables.map { |var, value| "#{var}=#{value};" }.join
    expressions.each do |expr|
      assert_equal eval(ruby_variables + expr).to_s, evaluate(expr, expr_variables).to_s
    end
  end
end
