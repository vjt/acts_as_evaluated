require 'boolean_expression_grammar'

class BooleanExpressionParser < Dhaka::CompiledParser

  self.grammar = BooleanExpressionGrammar

  start_with 0

  at_state(41) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 42 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(31) {
    for_symbol('word_literal') { shift_to 29 }
    for_symbol('var_name') { shift_to 32 }
  }

  at_state(21) {
    for_symbol('+') { reduce_with 'function_call' }
    for_symbol('and') { reduce_with 'function_call' }
    for_symbol('-') { reduce_with 'function_call' }
    for_symbol('or') { reduce_with 'function_call' }
    for_symbol('greater_or_equal_than') { reduce_with 'function_call' }
    for_symbol('/') { reduce_with 'function_call' }
    for_symbol('different_to') { reduce_with 'function_call' }
    for_symbol('in') { reduce_with 'function_call' }
    for_symbol('less_or_equal_than') { reduce_with 'function_call' }
    for_symbol('_End_') { reduce_with 'function_call' }
    for_symbol('less_than') { reduce_with 'function_call' }
    for_symbol('^') { reduce_with 'function_call' }
    for_symbol('not') { reduce_with 'function_call' }
    for_symbol(')') { reduce_with 'function_call' }
    for_symbol('equal_to') { reduce_with 'function_call' }
    for_symbol('greater_than') { reduce_with 'function_call' }
    for_symbol('*') { reduce_with 'function_call' }
  }

  at_state(51) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('bool_expression') { shift_to 53 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 51 }
    for_symbol('bool_literal') { shift_to 45 }
    for_symbol('not') { shift_to 43 }
    for_symbol('math_expression') { shift_to 52 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
    for_symbol('bool_value') { shift_to 55 }
  }

  at_state(47) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('bool_expression') { shift_to 48 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 51 }
    for_symbol('bool_literal') { shift_to 45 }
    for_symbol('not') { shift_to 43 }
    for_symbol('math_expression') { shift_to 44 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
    for_symbol('bool_value') { shift_to 55 }
  }

  at_state(45) {
    for_symbol('and') { reduce_with 'bool_literal' }
    for_symbol('or') { reduce_with 'bool_literal' }
    for_symbol('_End_') { reduce_with 'bool_literal' }
    for_symbol(')') { reduce_with 'bool_literal' }
  }

  at_state(38) {
    for_symbol('+') { shift_to 5 }
    for_symbol('and') { reduce_with 'less_or_equal_than' }
    for_symbol('-') { shift_to 11 }
    for_symbol('or') { reduce_with 'less_or_equal_than' }
    for_symbol('/') { shift_to 7 }
    for_symbol('_End_') { reduce_with 'less_or_equal_than' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'less_or_equal_than' }
    for_symbol('*') { shift_to 3 }
  }

  at_state(25) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 26 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(24) {
    for_symbol('+') { reduce_with 'parenthesized_math_expression' }
    for_symbol('and') { reduce_with 'parenthesized_math_expression' }
    for_symbol('-') { reduce_with 'parenthesized_math_expression' }
    for_symbol('or') { reduce_with 'parenthesized_math_expression' }
    for_symbol('greater_or_equal_than') { reduce_with 'parenthesized_math_expression' }
    for_symbol('/') { reduce_with 'parenthesized_math_expression' }
    for_symbol('different_to') { reduce_with 'parenthesized_math_expression' }
    for_symbol('in') { reduce_with 'parenthesized_math_expression' }
    for_symbol('less_or_equal_than') { reduce_with 'parenthesized_math_expression' }
    for_symbol('_End_') { reduce_with 'parenthesized_math_expression' }
    for_symbol('less_than') { reduce_with 'parenthesized_math_expression' }
    for_symbol('^') { reduce_with 'parenthesized_math_expression' }
    for_symbol('not') { reduce_with 'parenthesized_math_expression' }
    for_symbol(')') { reduce_with 'parenthesized_math_expression' }
    for_symbol('equal_to') { reduce_with 'parenthesized_math_expression' }
    for_symbol('greater_than') { reduce_with 'parenthesized_math_expression' }
    for_symbol('*') { reduce_with 'parenthesized_math_expression' }
  }

  at_state(7) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 8 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(4) {
    for_symbol('+') { reduce_with 'multiplication' }
    for_symbol('and') { reduce_with 'multiplication' }
    for_symbol('-') { reduce_with 'multiplication' }
    for_symbol('or') { reduce_with 'multiplication' }
    for_symbol('greater_or_equal_than') { reduce_with 'multiplication' }
    for_symbol('/') { reduce_with 'multiplication' }
    for_symbol('different_to') { reduce_with 'multiplication' }
    for_symbol('in') { reduce_with 'multiplication' }
    for_symbol('less_or_equal_than') { reduce_with 'multiplication' }
    for_symbol('_End_') { reduce_with 'multiplication' }
    for_symbol('less_than') { reduce_with 'multiplication' }
    for_symbol('not') { reduce_with 'multiplication' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'multiplication' }
    for_symbol('equal_to') { reduce_with 'multiplication' }
    for_symbol('greater_than') { reduce_with 'multiplication' }
    for_symbol('*') { reduce_with 'multiplication' }
  }

  at_state(43) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('bool_expression') { shift_to 46 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 51 }
    for_symbol('bool_literal') { shift_to 45 }
    for_symbol('not') { shift_to 43 }
    for_symbol('math_expression') { shift_to 44 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
    for_symbol('bool_value') { shift_to 55 }
  }

  at_state(36) {
    for_symbol('+') { shift_to 5 }
    for_symbol('and') { reduce_with 'equal_to' }
    for_symbol('-') { shift_to 11 }
    for_symbol('or') { reduce_with 'equal_to' }
    for_symbol('/') { shift_to 7 }
    for_symbol('_End_') { reduce_with 'equal_to' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'equal_to' }
    for_symbol('*') { shift_to 3 }
  }

  at_state(27) {
    for_symbol('in') { shift_to 28 }
  }

  at_state(9) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 10 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(5) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 6 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(2) {
    for_symbol('+') { shift_to 5 }
    for_symbol('-') { shift_to 11 }
    for_symbol('greater_or_equal_than') { shift_to 39 }
    for_symbol('/') { shift_to 7 }
    for_symbol('different_to') { shift_to 41 }
    for_symbol('in') { shift_to 31 }
    for_symbol('less_or_equal_than') { shift_to 37 }
    for_symbol('_End_') { reduce_with 'math_expression' }
    for_symbol('less_than') { shift_to 25 }
    for_symbol('^') { shift_to 9 }
    for_symbol('not') { shift_to 27 }
    for_symbol('equal_to') { shift_to 35 }
    for_symbol('greater_than') { shift_to 33 }
    for_symbol('*') { shift_to 3 }
  }

  at_state(52) {
    for_symbol('+') { shift_to 5 }
    for_symbol('-') { shift_to 11 }
    for_symbol('greater_or_equal_than') { shift_to 39 }
    for_symbol('/') { shift_to 7 }
    for_symbol('different_to') { shift_to 41 }
    for_symbol('in') { shift_to 31 }
    for_symbol('less_or_equal_than') { shift_to 37 }
    for_symbol('less_than') { shift_to 25 }
    for_symbol('^') { shift_to 9 }
    for_symbol('not') { shift_to 27 }
    for_symbol(')') { shift_to 24 }
    for_symbol('equal_to') { shift_to 35 }
    for_symbol('greater_than') { shift_to 33 }
    for_symbol('*') { shift_to 3 }
  }

  at_state(44) {
    for_symbol('+') { shift_to 5 }
    for_symbol('-') { shift_to 11 }
    for_symbol('greater_or_equal_than') { shift_to 39 }
    for_symbol('/') { shift_to 7 }
    for_symbol('different_to') { shift_to 41 }
    for_symbol('in') { shift_to 31 }
    for_symbol('less_or_equal_than') { shift_to 37 }
    for_symbol('less_than') { shift_to 25 }
    for_symbol('^') { shift_to 9 }
    for_symbol('not') { shift_to 27 }
    for_symbol('equal_to') { shift_to 35 }
    for_symbol('greater_than') { shift_to 33 }
    for_symbol('*') { shift_to 3 }
  }

  at_state(30) {
    for_symbol('and') { reduce_with 'array_exclusion' }
    for_symbol('or') { reduce_with 'array_exclusion' }
    for_symbol('_End_') { reduce_with 'array_exclusion' }
    for_symbol(')') { reduce_with 'array_exclusion' }
  }

  at_state(23) {
    for_symbol('+') { shift_to 5 }
    for_symbol('-') { shift_to 11 }
    for_symbol('/') { shift_to 7 }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { shift_to 24 }
    for_symbol('*') { shift_to 3 }
  }

  at_state(19) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 20 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(3) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 4 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(35) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 36 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(28) {
    for_symbol('word_literal') { shift_to 29 }
    for_symbol('var_name') { shift_to 30 }
  }

  at_state(55) {
    for_symbol('and') { reduce_with 'bool_value' }
    for_symbol('or') { reduce_with 'bool_value' }
    for_symbol('_End_') { reduce_with 'bool_value' }
    for_symbol(')') { reduce_with 'bool_value' }
  }

  at_state(53) {
    for_symbol('and') { shift_to 47 }
    for_symbol('or') { shift_to 49 }
    for_symbol(')') { shift_to 54 }
  }

  at_state(49) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 51 }
    for_symbol('bool_literal') { shift_to 45 }
    for_symbol('not') { shift_to 43 }
    for_symbol('math_expression') { shift_to 44 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
    for_symbol('bool_value') { shift_to 50 }
  }

  at_state(42) {
    for_symbol('+') { shift_to 5 }
    for_symbol('and') { reduce_with 'different_to' }
    for_symbol('-') { shift_to 11 }
    for_symbol('or') { reduce_with 'different_to' }
    for_symbol('/') { shift_to 7 }
    for_symbol('_End_') { reduce_with 'different_to' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'different_to' }
    for_symbol('*') { shift_to 3 }
  }

  at_state(40) {
    for_symbol('+') { shift_to 5 }
    for_symbol('and') { reduce_with 'greater_or_equal_than' }
    for_symbol('-') { shift_to 11 }
    for_symbol('or') { reduce_with 'greater_or_equal_than' }
    for_symbol('/') { shift_to 7 }
    for_symbol('_End_') { reduce_with 'greater_or_equal_than' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'greater_or_equal_than' }
    for_symbol('*') { shift_to 3 }
  }

  at_state(33) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 34 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(14) {
    for_symbol('+') { reduce_with 'int_literal' }
    for_symbol('and') { reduce_with 'int_literal' }
    for_symbol('-') { reduce_with 'int_literal' }
    for_symbol('or') { reduce_with 'int_literal' }
    for_symbol('greater_or_equal_than') { reduce_with 'int_literal' }
    for_symbol('/') { reduce_with 'int_literal' }
    for_symbol('different_to') { reduce_with 'int_literal' }
    for_symbol('in') { reduce_with 'int_literal' }
    for_symbol('less_or_equal_than') { reduce_with 'int_literal' }
    for_symbol('_End_') { reduce_with 'int_literal' }
    for_symbol('less_than') { reduce_with 'int_literal' }
    for_symbol('^') { reduce_with 'int_literal' }
    for_symbol('not') { reduce_with 'int_literal' }
    for_symbol(')') { reduce_with 'int_literal' }
    for_symbol('equal_to') { reduce_with 'int_literal' }
    for_symbol('greater_than') { reduce_with 'int_literal' }
    for_symbol('*') { reduce_with 'int_literal' }
  }

  at_state(6) {
    for_symbol('+') { reduce_with 'addition' }
    for_symbol('and') { reduce_with 'addition' }
    for_symbol('-') { reduce_with 'addition' }
    for_symbol('or') { reduce_with 'addition' }
    for_symbol('greater_or_equal_than') { reduce_with 'addition' }
    for_symbol('/') { shift_to 7 }
    for_symbol('different_to') { reduce_with 'addition' }
    for_symbol('in') { reduce_with 'addition' }
    for_symbol('less_or_equal_than') { reduce_with 'addition' }
    for_symbol('_End_') { reduce_with 'addition' }
    for_symbol('less_than') { reduce_with 'addition' }
    for_symbol('not') { reduce_with 'addition' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'addition' }
    for_symbol('equal_to') { reduce_with 'addition' }
    for_symbol('greater_than') { reduce_with 'addition' }
    for_symbol('*') { shift_to 3 }
  }

  at_state(39) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 40 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(17) {
    for_symbol('+') { reduce_with 'float_literal' }
    for_symbol('and') { reduce_with 'float_literal' }
    for_symbol('-') { reduce_with 'float_literal' }
    for_symbol('or') { reduce_with 'float_literal' }
    for_symbol('greater_or_equal_than') { reduce_with 'float_literal' }
    for_symbol('/') { reduce_with 'float_literal' }
    for_symbol('different_to') { reduce_with 'float_literal' }
    for_symbol('in') { reduce_with 'float_literal' }
    for_symbol('less_or_equal_than') { reduce_with 'float_literal' }
    for_symbol('_End_') { reduce_with 'float_literal' }
    for_symbol('less_than') { reduce_with 'float_literal' }
    for_symbol('^') { reduce_with 'float_literal' }
    for_symbol('not') { reduce_with 'float_literal' }
    for_symbol(')') { reduce_with 'float_literal' }
    for_symbol('equal_to') { reduce_with 'float_literal' }
    for_symbol('greater_than') { reduce_with 'float_literal' }
    for_symbol('*') { reduce_with 'float_literal' }
  }

  at_state(13) {
    for_symbol('+') { reduce_with 'variable_reference' }
    for_symbol('and') { reduce_with 'variable_reference' }
    for_symbol('-') { reduce_with 'variable_reference' }
    for_symbol('or') { reduce_with 'variable_reference' }
    for_symbol('greater_or_equal_than') { reduce_with 'variable_reference' }
    for_symbol('/') { reduce_with 'variable_reference' }
    for_symbol('different_to') { reduce_with 'variable_reference' }
    for_symbol('in') { reduce_with 'variable_reference' }
    for_symbol('less_or_equal_than') { reduce_with 'variable_reference' }
    for_symbol('_End_') { reduce_with 'variable_reference' }
    for_symbol('less_than') { reduce_with 'variable_reference' }
    for_symbol('^') { reduce_with 'variable_reference' }
    for_symbol('not') { reduce_with 'variable_reference' }
    for_symbol(')') { reduce_with 'variable_reference' }
    for_symbol('equal_to') { reduce_with 'variable_reference' }
    for_symbol('greater_than') { reduce_with 'variable_reference' }
    for_symbol('*') { reduce_with 'variable_reference' }
  }

  at_state(10) {
    for_symbol('+') { reduce_with 'power' }
    for_symbol('and') { reduce_with 'power' }
    for_symbol('-') { reduce_with 'power' }
    for_symbol('or') { reduce_with 'power' }
    for_symbol('greater_or_equal_than') { reduce_with 'power' }
    for_symbol('/') { reduce_with 'power' }
    for_symbol('different_to') { reduce_with 'power' }
    for_symbol('in') { reduce_with 'power' }
    for_symbol('less_or_equal_than') { reduce_with 'power' }
    for_symbol('_End_') { reduce_with 'power' }
    for_symbol('less_than') { reduce_with 'power' }
    for_symbol('not') { reduce_with 'power' }
    for_symbol(')') { reduce_with 'power' }
    for_symbol('equal_to') { reduce_with 'power' }
    for_symbol('greater_than') { reduce_with 'power' }
    for_symbol('*') { reduce_with 'power' }
  }

  at_state(0) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('bool_expression') { shift_to 56 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 51 }
    for_symbol('bool_literal') { shift_to 45 }
    for_symbol('not') { shift_to 43 }
    for_symbol('math_expression') { shift_to 2 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
    for_symbol('bool_value') { shift_to 55 }
  }

  at_state(56) {
    for_symbol('and') { shift_to 47 }
    for_symbol('or') { shift_to 49 }
    for_symbol('_End_') { reduce_with 'simple_expression' }
  }

  at_state(54) {
    for_symbol('and') { reduce_with 'parenthesized_bool_expression' }
    for_symbol('or') { reduce_with 'parenthesized_bool_expression' }
    for_symbol('_End_') { reduce_with 'parenthesized_bool_expression' }
    for_symbol(')') { reduce_with 'parenthesized_bool_expression' }
  }

  at_state(50) {
    for_symbol('and') { reduce_with 'or_expression' }
    for_symbol('or') { reduce_with 'or_expression' }
    for_symbol('_End_') { reduce_with 'or_expression' }
    for_symbol(')') { reduce_with 'or_expression' }
  }

  at_state(48) {
    for_symbol('and') { reduce_with 'and_expression' }
    for_symbol('or') { reduce_with 'and_expression' }
    for_symbol('_End_') { reduce_with 'and_expression' }
    for_symbol(')') { reduce_with 'and_expression' }
  }

  at_state(46) {
    for_symbol('and') { reduce_with 'negated_bool_expression' }
    for_symbol('or') { reduce_with 'negated_bool_expression' }
    for_symbol('_End_') { reduce_with 'negated_bool_expression' }
    for_symbol(')') { reduce_with 'negated_bool_expression' }
  }

  at_state(37) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 38 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(26) {
    for_symbol('+') { shift_to 5 }
    for_symbol('and') { reduce_with 'less_than' }
    for_symbol('-') { shift_to 11 }
    for_symbol('or') { reduce_with 'less_than' }
    for_symbol('/') { shift_to 7 }
    for_symbol('_End_') { reduce_with 'less_than' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'less_than' }
    for_symbol('*') { shift_to 3 }
  }

  at_state(20) {
    for_symbol('+') { shift_to 5 }
    for_symbol('-') { shift_to 11 }
    for_symbol('/') { shift_to 7 }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { shift_to 21 }
    for_symbol('*') { shift_to 3 }
  }

  at_state(16) {
    for_symbol('+') { reduce_with 'negated_math_expression' }
    for_symbol('and') { reduce_with 'negated_math_expression' }
    for_symbol('-') { reduce_with 'negated_math_expression' }
    for_symbol('or') { reduce_with 'negated_math_expression' }
    for_symbol('greater_or_equal_than') { reduce_with 'negated_math_expression' }
    for_symbol('/') { reduce_with 'negated_math_expression' }
    for_symbol('different_to') { reduce_with 'negated_math_expression' }
    for_symbol('in') { reduce_with 'negated_math_expression' }
    for_symbol('less_or_equal_than') { reduce_with 'negated_math_expression' }
    for_symbol('_End_') { reduce_with 'negated_math_expression' }
    for_symbol('less_than') { reduce_with 'negated_math_expression' }
    for_symbol('not') { reduce_with 'negated_math_expression' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'negated_math_expression' }
    for_symbol('equal_to') { reduce_with 'negated_math_expression' }
    for_symbol('greater_than') { reduce_with 'negated_math_expression' }
    for_symbol('*') { reduce_with 'negated_math_expression' }
  }

  at_state(15) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 16 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(12) {
    for_symbol('+') { reduce_with 'subtraction' }
    for_symbol('and') { reduce_with 'subtraction' }
    for_symbol('-') { reduce_with 'subtraction' }
    for_symbol('or') { reduce_with 'subtraction' }
    for_symbol('greater_or_equal_than') { reduce_with 'subtraction' }
    for_symbol('/') { shift_to 7 }
    for_symbol('different_to') { reduce_with 'subtraction' }
    for_symbol('in') { reduce_with 'subtraction' }
    for_symbol('less_or_equal_than') { reduce_with 'subtraction' }
    for_symbol('_End_') { reduce_with 'subtraction' }
    for_symbol('less_than') { reduce_with 'subtraction' }
    for_symbol('not') { reduce_with 'subtraction' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'subtraction' }
    for_symbol('equal_to') { reduce_with 'subtraction' }
    for_symbol('greater_than') { reduce_with 'subtraction' }
    for_symbol('*') { shift_to 3 }
  }

  at_state(1) {
    for_symbol('+') { reduce_with 'variable_name' }
    for_symbol('and') { reduce_with 'variable_name' }
    for_symbol('-') { reduce_with 'variable_name' }
    for_symbol('or') { reduce_with 'variable_name' }
    for_symbol('greater_or_equal_than') { reduce_with 'variable_name' }
    for_symbol('/') { reduce_with 'variable_name' }
    for_symbol('different_to') { reduce_with 'variable_name' }
    for_symbol('in') { reduce_with 'variable_name' }
    for_symbol('less_or_equal_than') { reduce_with 'variable_name' }
    for_symbol('_End_') { reduce_with 'variable_name' }
    for_symbol('less_than') { reduce_with 'variable_name' }
    for_symbol('^') { reduce_with 'variable_name' }
    for_symbol('not') { reduce_with 'variable_name' }
    for_symbol('(') { reduce_with 'function_name' }
    for_symbol(')') { reduce_with 'variable_name' }
    for_symbol('equal_to') { reduce_with 'variable_name' }
    for_symbol('greater_than') { reduce_with 'variable_name' }
    for_symbol('*') { reduce_with 'variable_name' }
  }

  at_state(34) {
    for_symbol('+') { shift_to 5 }
    for_symbol('and') { reduce_with 'greater_than' }
    for_symbol('-') { shift_to 11 }
    for_symbol('or') { reduce_with 'greater_than' }
    for_symbol('/') { shift_to 7 }
    for_symbol('_End_') { reduce_with 'greater_than' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'greater_than' }
    for_symbol('*') { shift_to 3 }
  }

  at_state(32) {
    for_symbol('and') { reduce_with 'array_inclusion' }
    for_symbol('or') { reduce_with 'array_inclusion' }
    for_symbol('_End_') { reduce_with 'array_inclusion' }
    for_symbol(')') { reduce_with 'array_inclusion' }
  }

  at_state(22) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 23 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(11) {
    for_symbol('-') { shift_to 15 }
    for_symbol('word_literal') { shift_to 1 }
    for_symbol('float_literal') { shift_to 17 }
    for_symbol('var_name') { shift_to 13 }
    for_symbol('(') { shift_to 22 }
    for_symbol('math_expression') { shift_to 12 }
    for_symbol('int_literal') { shift_to 14 }
    for_symbol('func_name') { shift_to 18 }
  }

  at_state(8) {
    for_symbol('+') { reduce_with 'division' }
    for_symbol('and') { reduce_with 'division' }
    for_symbol('-') { reduce_with 'division' }
    for_symbol('or') { reduce_with 'division' }
    for_symbol('greater_or_equal_than') { reduce_with 'division' }
    for_symbol('/') { reduce_with 'division' }
    for_symbol('different_to') { reduce_with 'division' }
    for_symbol('in') { reduce_with 'division' }
    for_symbol('less_or_equal_than') { reduce_with 'division' }
    for_symbol('_End_') { reduce_with 'division' }
    for_symbol('less_than') { reduce_with 'division' }
    for_symbol('not') { reduce_with 'division' }
    for_symbol('^') { shift_to 9 }
    for_symbol(')') { reduce_with 'division' }
    for_symbol('equal_to') { reduce_with 'division' }
    for_symbol('greater_than') { reduce_with 'division' }
    for_symbol('*') { reduce_with 'division' }
  }

  at_state(29) {
    for_symbol('and') { reduce_with 'variable_name' }
    for_symbol('or') { reduce_with 'variable_name' }
    for_symbol('_End_') { reduce_with 'variable_name' }
    for_symbol(')') { reduce_with 'variable_name' }
  }

  at_state(18) {
    for_symbol('(') { shift_to 19 }
  }

end
