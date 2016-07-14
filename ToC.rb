#Based on the exercise in 6.2 of Learn to Program by Chris Pine...I went a little overboard
puts 'Hi there let\'s make a table of contents...I\'ll ask a few questions to get started.'
puts 'How wide do you want your margins to be?'
width = gets.chomp
wnum = width.to_i
puts 'Good, now how many chapters are in your book?'
chapters = gets.chomp
cnum = chapters.to_i
my_array = Hash.new

for x in 1..cnum
  puts 'What\'s chapter ' + x.to_s + ' called?'
  cname = gets.chomp
  puts 'And what page does it start on?'
  pnum = gets.chomp
  my_array[cname] = pnum
end
puts ('Table of Contents'.center(wnum))

my_array.each do |x, y|
  n = 1
  if y.to_i < 10
    puts (('Chapter ' + n.to_s + ':  ' + x).ljust(wnum/2)) + (('page  '.rjust((wnum/2)-1)+ y))
  else
    puts (('Chapter ' + n.to_s + ':  ' + x).ljust(wnum/2)) + (('page ' + y).rjust(wnum/2))  
  end
  n += 1
end
