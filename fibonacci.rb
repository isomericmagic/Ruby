# https://en.wikipedia.org/wiki/Fibonacci_number
# input any number and this will return the Fibonacci number for it

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts "What number would you like to calculate?"
answer = gets.chomp.to_i
puts ""
puts "The fibonacci number for #{answer} is " + fibonacci(answer).to_s + "."
