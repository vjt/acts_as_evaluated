#!/usr/bin/env ruby
#
puts (Dir['boolean*'] - ['boolean_expression_parser.rb'] + Dir['../test/*']).map { |file|
  "## #{File.basename(file)} [ruby]\n" + File.read(file) + "\n\n"
}
