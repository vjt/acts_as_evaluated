$: << File.join(File.dirname(__FILE__), 'evaluator')

%w(tokenizer parser evaluator driver).each do |component|
  require 'boolean_expression_' << component
end
