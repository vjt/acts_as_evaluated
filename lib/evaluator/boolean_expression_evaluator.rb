require 'dhaka'
require 'active_support'
require 'boolean_expression_grammar'

class BooleanExpressionEvaluator < Dhaka::Evaluator
  
  self.grammar = BooleanExpressionGrammar
  
  define_evaluation_rules do
    # Start symbol
    #
    for_simple_expression do
      evaluate(child_nodes[0])
    end

    for_math_expression do
      evaluate(child_nodes[0])
    end

    # Bool expression
    #
    for_bool_value do
      evaluate(child_nodes[0])
    end

    for_or_expression do
      evaluate(child_nodes[0]) or evaluate(child_nodes[2])
    end

    for_and_expression do
      evaluate(child_nodes[0]) and evaluate(child_nodes[2])
    end

    # Bool value
    #
    for_bool_literal do
      child_nodes[0].token.value == 'true'
    end

    for_less_than do
      evaluate(child_nodes[0]) < evaluate(child_nodes[2])
    end

    for_less_or_equal_than do
      evaluate(child_nodes[0]) <= evaluate(child_nodes[2])
    end

    for_greater_than do
      evaluate(child_nodes[0]) > evaluate(child_nodes[2])
    end

    for_greater_or_equal_than do
      evaluate(child_nodes[0]) >= evaluate(child_nodes[2])
    end

    for_equal_to do
      evaluate(child_nodes[0]) == evaluate(child_nodes[2])
    end

    for_different_to do
      evaluate(child_nodes[0]) != evaluate(child_nodes[2])
    end

    for_parenthesized_bool_expression do
      evaluate(child_nodes[1])
    end
    
    for_negated_bool_expression do
      not evaluate(child_nodes[1])
    end

    for_array_inclusion do
      item_included_in_ary? child_nodes[0], child_nodes[2]
    end

    for_array_exclusion do
      not item_included_in_ary? child_nodes[0], child_nodes[3]
    end

    # Math expression
    #
    for_subtraction do 
      evaluate(child_nodes[0]) - evaluate(child_nodes[2])
    end

    for_addition do
      evaluate(child_nodes[0]) + evaluate(child_nodes[2])
    end

    for_division do
      evaluate(child_nodes[0]) / evaluate(child_nodes[2]) 
    end

    for_multiplication do
      evaluate(child_nodes[0]) * evaluate(child_nodes[2])
    end

    for_int_literal do
      child_nodes[0].token.value.to_i
    end

    for_float_literal do
      child_nodes[0].token.value.to_f
    end

    for_parenthesized_math_expression do
      evaluate(child_nodes[1])
    end
    
    for_negated_math_expression do
      -evaluate(child_nodes[1])
    end
    
    for_power do
      evaluate(child_nodes[0])**evaluate(child_nodes[2])
    end

    for_variable_name do
      child_nodes[0].token.value
    end

    for_function_name do
      child_nodes[0].token.value
    end

    for_bool_name do
      child_nodes[0].token.value
    end

    for_variable_reference do
      eval_variable child_nodes[0]
    end

    for_function_call do
      function_name = evaluate(child_nodes[0])
      raise BooleanExpressionError, "Invalid function #{function_name}" unless Math.respond_to? function_name
      argument = evaluate(child_nodes[2])
      if function_name =~ /^(sin|cos|tan)$/
        argument = argument * Math::PI / 180
      end
      Math.send function_name, argument
    end
  end

  def initialize
    @variables = nil
  end

  attr_reader :variables
  def variables=(variables = nil)
    @variables = variables || {}
  end

  private
  def eval_variable node
    name = evaluate node
    raise BooleanExpressionError, "Undefined variable #{variable_name}" unless @variables.has_key? name
    @variables[name]
  end

  def item_included_in_ary? val_node, ary_node
    ary = eval_variable(ary_node)
    raise BooleanExpressionError, "#{ary.inspect} is not an array!" unless ary.is_a?(Array)
    ary.include? evaluate(val_node)
  end
end

class BooleanExpressionError < StandardError
end
