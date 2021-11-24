# frozen_string_literal: true

require 'byebug'
# Setter and getter for example
# def first_name
#   @first_name
# end
#
# def last_name
#   @last_name
# end
#
# def email
#  @email
# end
#
# def first_name=(first_name)
#   @first_name = first_name
# end
#
# def last_name=(last_name)
#   @last_name = last_name
# end
#
# def email=(email)
#   @email = email
# end
#

class User
  attr_accessor :email, :last_name, :first_name

  def initialize(first_name:, last_name:, email:)
    @first_name = first_name
    @last_name = last_name
    @email = email
  end

  def full_name
    if @first_name.instance_of?(String) && @last_name.instance_of?(String)
      "#{@first_name} #{@last_name}"
    else
      @first_name || @last_name
    end
  end

  def valid_email?
    @email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i) ? true : false
  end

  def errors
    @arr = []
    errors_for_first_name
    errors_for_lsat_name
    errors_for_email
    @arr
  end

  def valid?
    errors
    @arr.empty? ? true : false
  end

  private

  def errors_for_first_name
    if @first_name.nil? || @first_name.empty?
      @arr << 'first_name can not be empty'
      @arr << 'first_name can not a String' unless @first_name.instance_of?(String)
    elsif @first_name.nil? || @first_name.split('').size < 3
      @arr << 'first_name very short'
    end
  end

  def errors_for_lsat_name
    if @last_name.nil? || @last_name.empty?
      @arr << 'last_name can not be empty'
      @arr << 'last_name can not a String' unless @last_name.instance_of?(String)
    elsif @last_name.split('').size < 3
      @arr << 'last_name very short'
    end
  end

  def errors_for_email
    if @email.nil? || @email.empty?
      @arr << 'email can not be empty'
      @arr << 'email can not a String' unless @email.instance_of?(String)
    elsif valid_email? == false
      @arr << 'email is invalid'
    end
  end
end

u1 = User.new(first_name: 'John', last_name: nil, email: 'Doe.Johngmailgmail.com')
puts "First name: #{u1.first_name}"
puts "Last name: #{u1.last_name}"
puts "Email: #{u1.email}"
puts "Full name: #{u1.full_name}"
puts "Valid_email: #{u1.valid_email?}"
puts "User is valid: #{u1.valid?}"
puts "Errors: #{u1.errors}"
puts '------------------------------------------------------------'

u1.last_name = 'Doe'
u1.email = 'Doe.Johngmail@gmail.com'
puts "Valid_email: #{u1.valid_email?}"
puts "User is valid: #{u1.valid?}"
puts "Errors: #{u1.errors}"
