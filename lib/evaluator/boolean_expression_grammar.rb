require 'dhaka'

class BooleanExpressionGrammar < Dhaka::Grammar
  precedences do
    left ['less_than', 'less_or_equal_than', 'greater_than', 'greater_or_equal_than', 'equal_to', 'different_to']
    left ['+', '-']
    left ['*', '/']
    nonassoc ['^']
    left ['or']
    left ['and']
    nonassoc ['not']
  end
  
  for_symbol(Dhaka::START_SYMBOL_NAME) do
    simple_expression ['bool_expression']
    math_expression ['math_expression']
  end

  for_symbol('bool_expression') do
    bool_value ['bool_value']
    or_expression ['bool_expression', 'or', 'bool_value'] # this is a cargo cult
    and_expression ['bool_expression', 'and', 'bool_expression']
  end

  for_symbol('bool_value') do
    bool_literal ['bool_literal']
    less_than ['math_expression', 'less_than', 'math_expression']
    less_or_equal_than ['math_expression', 'less_or_equal_than', 'math_expression']
    greater_than ['math_expression', 'greater_than', 'math_expression']
    greater_or_equal_than ['math_expression', 'greater_or_equal_than', 'math_expression']
    equal_to ['math_expression', 'equal_to', 'math_expression']
    different_to ['math_expression', 'different_to', 'math_expression']
    parenthesized_bool_expression ['(', 'bool_expression', ')']
    negated_bool_expression ['not', 'bool_expression']
    array_inclusion ['math_expression', 'in', 'var_name' ]
    array_exclusion ['math_expression', 'not', 'in', 'var_name' ]
  end

  for_symbol('math_expression') do
    addition ['math_expression', '+', 'math_expression']
    subtraction ['math_expression', '-', 'math_expression']
    multiplication ['math_expression', '*', 'math_expression']
    division ['math_expression', '/', 'math_expression']
    power ['math_expression', '^', 'math_expression']
    int_literal ['int_literal']
    float_literal ['float_literal']
    variable_reference ['var_name']
    function_call ['func_name', '(', 'math_expression', ')']
    parenthesized_math_expression ['(', 'math_expression', ')']
    negated_math_expression ['-', 'math_expression'], :prec => '*'
  end

  for_symbol('var_name') do
    variable_name ['word_literal']
  end

  for_symbol('func_name') do
    function_name ['word_literal']
  end
end
