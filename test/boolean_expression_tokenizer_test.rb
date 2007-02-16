require 'test/unit'
require 'dhaka'
require 'boolean_expression_tokenizer'

class TestBooleanExpressionTokenizer < Test::Unit::TestCase
  def test_tokenizes_boolean_expressions
    tokenizer = BooleanExpressionTokenizer
    assert_kind_of(Class, tokenizer.tokenize("2 * 3 + 2 >= sqrt(4) and sux == 3").class)
    assert_equal("Dhaka::TokenizerSuccessResult", tokenizer.tokenize("2 * 3 + 2 >= sqrt(4) and sux == 3").class.inspect)
    assert_kind_of(Class, tokenizer.tokenize("| % ^").class)
    assert_equal("Dhaka::TokenizerErrorResult", tokenizer.tokenize("| % ^").class.inspect)
  end
end
