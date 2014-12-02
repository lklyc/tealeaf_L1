# 1. string interpolation vs concatenation
# 2. extract repetitive logic to methods
# 3. keep track of variabl types (class)
# 4. variable scope determined by do...end; outer scope vars are available to inner scope, but not vice versa
# 5. pass by ref vs pass by value; if method mutates caller, obj is modified
require 'pry'

def say(msg)
  puts "--------- #{msg} ---------"
end


say "what's the 1st number?"
num1 = gets.chomp

say "what's the 2nd number?"
num2 = gets.chomp

say "1) add 2) subtract 3)multiply 4)divide"
operator = gets.chomp

puts "Numbers: #{num1} #{num2}. You chose to #{operator}"

# binding.pry

if operator == '1'
  result = num1.to_i + num2.to_i
elsif operator == '2'
  result = num1.to_i - num2.to_i
elsif operator == '3'
  result = num1.to_i * num2.to_i
else
  result = num1.to_f / num2.to_f
end

say "Result is #{result}"