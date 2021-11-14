# frozen_string_literal: true

class Brackets
  attr_writer :brackets

  def initialize(brackets)
    @brackets = brackets
  end

  def valid?
    stack = []
    brackets = { '{' => '}', '[' => ']', '(' => ')', '<' => '>' }
    @brackets.each_char do |char|
      stack << char if brackets.key?(char)
      return false if brackets.key(char) && brackets.key(char) != stack.pop
    end
    stack.empty?
  end

end

puts Brackets.new('{(})').valid?   # => false
puts Brackets.new('{{[]').valid?   # => false
puts Brackets.new('{[()]}').valid? # => true
puts Brackets.new('<<>>').valid?   # => true
puts "---------------------------------------------------------------------"

#It is Monkey Patching in Ruby
class String
  def valid?
    stack = []
    brackets = { '{' => '}', '[' => ']', '(' => ')', '<' => '>' }
    self.each_char do |char|
      stack << char if brackets.key?(char)
      return false if brackets.key(char) && brackets.key(char) != stack.pop
    end
    stack.empty?
  end
end

puts '{(})'.valid?   # => false
puts '{{[]'.valid?   # => false
puts '{[()]}'.valid? # => true
puts '<<>>'.valid?   # => true