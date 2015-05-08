require 'highline'

term = HighLine.new
name = term.ask "What's your name, buddy?  "
puts "Hi there, #{name}. Let's sell some fries."
