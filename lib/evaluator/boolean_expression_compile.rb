require 'dhaka'
require 'boolean_expression_grammar'

requires = "require 'boolean_expression_grammar'\n\n"
parser = Dhaka::Parser.new(BooleanExpressionGrammar)
File.open('boolean_expression_parser.rb', 'w+') do |file|
  file.write requires + parser.compile_to_ruby_source_as(:BooleanExpressionParser)
end

