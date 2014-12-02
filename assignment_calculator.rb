require 'pry'

# function for outputing text to console
def say(text)
  puts ">> #{text}"
end

say "Welcome to my calculator"

begin 
  say "Specify the amount of numbers (min 2, max 5) you'd like to work with"
  amount_numbers = gets.chomp
end while (amount_numbers.to_i <= 1) || (amount_numbers.to_i > 5)

arr = []

i = 0

amount_numbers.to_i.times do 

  say "Please specify input #{ i + 1}"
  arr << gets.chomp

  i += 1
end

say "Please select one of the following operation:"
say "(1) sum"
say "(2) subtract"
say "(3) multiply"
say "(4) divide"

operation = gets.chomp.to_i

answer = 0

case operation
when 1
  arr.each {|n| answer += n.to_i}
when 2
  arr.each {|n| answer -= n.to_i}
when 3
  answer = 1
  arr.each {|n| answer *= n.to_i}
when 4
  answer = arr[0].to_f
  for i in 1..arr.count-1
    answer /= arr[i].to_f
  end
else
  answer = "invalid operation, abort"
end

say "The answer is #{answer}"



