require 'dhaka'

class BooleanExpressionTokenizer < Dhaka::Tokenizer
  CONNECTORS = [ 'and', 'or', 'not' ]
  BOOLEANS = [ 'true', 'false' ]

  digits = ('0'..'9').to_a
  letters = ('a'..'z').to_a << ('A'..'Z').to_a << '_'
  parens = ['(', ')']
  dollar = ['$']
  dot = ['.']
  operators = ['-', '+', '/', '*', '^']
  cmp_operators = ['<', '>', '=', '!']
  whitespace = [' ', "\n", "\r", "\t"]

  all_characters = digits + dollar + letters + parens + operators + cmp_operators + whitespace

  for_state Dhaka::TOKENIZER_IDLE_STATE do
    for_characters(all_characters - (digits + dot + dollar + letters + cmp_operators + whitespace)) do
      create_token(curr_char, nil)
      advance

      # ** alias for ^
      if curr_char == '*' and curr_token.symbol_name == '*'
        curr_token.symbol_name = '^'
        advance
      end
    end

    for_characters digits do
      create_token('int_literal', '')
      switch_to :get_number_literal
    end

    for_characters letters do
      create_token(nil, '')
      switch_to :get_word_literal
    end

    for_character dollar do
      advance # skip the dollar
      create_token(nil, '$')
      switch_to :get_word_literal
    end

    for_characters cmp_operators do
      create_token('', '')
      switch_to :get_comparison_operator
    end

    for_character whitespace do
      advance
    end
  end
  
  for_state :get_number_literal do
    for_characters all_characters - digits do
      switch_to Dhaka::TOKENIZER_IDLE_STATE
    end

    for_character dot do
      if curr_token.symbol_name == 'float_literal'
        switch_to :error
      else
        curr_token.symbol_name = 'float_literal'
        curr_token.value += curr_char
        advance
      end
    end

    for_characters digits do
      curr_token.value += curr_char
      advance
    end
  end

  for_state :get_word_literal do
    for_characters all_characters - (letters + digits) do
      curr_token.symbol_name = word_literal_symbol(curr_token.value)
      switch_to Dhaka::TOKENIZER_IDLE_STATE
    end

    for_characters letters + digits do
      curr_token.value += curr_char
      advance
      curr_token.symbol_name = word_literal_symbol(curr_token.value) unless curr_char
    end
  end

  for_state :get_comparison_operator do
    for_characters all_characters - cmp_operators do
      switch_to Dhaka::TOKENIZER_IDLE_STATE
    end

    for_characters cmp_operators do
      first_char = curr_char
      curr_token.symbol_name = cmp_lookup_level1[curr_char]
      advance

      if lookup = cmp_lookup_level2[first_char]
        if name = lookup[curr_char]
          curr_token.symbol_name = name
          advance
        else
          switch_to :error
        end
      end
      switch_to Dhaka::TOKENIZER_IDLE_STATE
    end
  end

  protected
  def word_literal_symbol(word)
    word.downcase!
    case
    when CONNECTORS.include?(word)
      word
    when BOOLEANS.include?(word)
      'bool_literal'
    when word == 'in'
      'in'
    else
      'word_literal'
    end
  end

  def cmp_lookup_level1
    { '<' => 'less_than',
      '>' => 'greater_than',
      '=' => 'equal_to',
      '!' => 'not' }
  end

  def cmp_lookup_level2
    { '=' => {
        '=' => 'equal_to',
      },
      '<' => {
        '=' => 'less_or_equal_than',
        '>' => 'different_to',
      },
      '>' => {
        '=' => 'greater_or_equal_than',
      },
      '!' => {
        '=' => 'different_to',
      }
    }
  end
end

