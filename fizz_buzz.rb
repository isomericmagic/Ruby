def fizzbuzz(num1, num2)
  num1.upto(num2) do |n|
    if n % 5 == 0 && n % 3 == 0
      print "FizzBuzz" + ", "
    elsif n % 3 == 0 && n % 5 != 0
      print "Fizz" + ", "
    elsif n % 5 == 0 && n % 3 != 0
      print "Buzz" + ", "
    else  
      print n.to_s + ", "
    end
  end
end

fizzbuzz(1, 15)

