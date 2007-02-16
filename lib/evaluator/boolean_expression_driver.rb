require 'boolean_expression_tokenizer'
require 'boolean_expression_parser'
require 'boolean_expression_evaluator'
require 'active_support'

class BooleanExpressionDriver
  def initialize
    @evaluator = BooleanExpressionEvaluator.new
  end

  def evaluate(expression, variables = nil)
    tokenize_result = BooleanExpressionTokenizer.tokenize(expression)
    if tokenize_result.has_error?
      raise BooleanExpressionError, tokenize_error_message(tokenize_result.unexpected_char_index, expression) 
    end
    
    parse_result = BooleanExpressionParser.parse(tokenize_result)
    if parse_result.has_error?
      raise BooleanExpressionError, parse_error_message(parse_result.unexpected_token, expression) 
    end
    
    @evaluator.variables = variables
    @evaluator.evaluate(parse_result.parse_tree)
  end

  protected
    def tokenize_error_message unexpected_char_index, expression
      raise BooleanExpressionError, "Unexpected character #{expression[unexpected_char_index].chr}:\n#{marked_expression(expression, unexpected_char_index)}"
    end

    def parse_error_message unexpected_token, expression
      if unexpected_token.symbol_name == Dhaka::END_SYMBOL_NAME
        "Unexpected end of file."
      else
        "Unexpected token #{unexpected_token.symbol_name}:\n#{marked_expression(expression, unexpected_token.input_position)}"
      end
    end

    def marked_expression(expression, error_position)
      if error_position > 0
        expression[0..(error_position-1)] + ">>>" + expression[error_position..-1]
      else
        ">>>"+expression
      end
    end
end
