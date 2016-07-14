require 'pry'

def hit(player, cards)
  player << cards.shift
end

def total_cards(hand)
  total = 0
  ace = hand.include?('Ace')
  hand.each do |card|
    case card
    when 'Ace'
      total += 1
    when 'Jack', 'Queen', 'King'
      total += 10
    else
      total += card
    end
  end
  total += 10 if ace && total <= 11
  total
end

def determine_winner(player_total, dealer_total)
  if player_total > dealer_total
    puts 'You win!'
  elsif player_total < dealer_total
    puts 'You lost.'
  else
    puts "It's a push!"
  end
end

total_wins_player = 0
total_wins_computer = 0
hit_or_stay = ''
play_again = ''

loop do
  deck = ['Ace', 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King'] * 4
  player_cards = []
  dealer_cards = []
  deck.shuffle!

  system 'clear'

  puts 'Welcome to Twenty-One.  Please play responsibly...'
  puts

  hit(player_cards, deck)
  hit(player_cards, deck)
  hit(dealer_cards, deck)
  hit(dealer_cards, deck)

  puts "You have the following cards: "
  print player_cards
  puts
  puts
  puts "Dealer is showing the following: "
  print "[" + dealer_cards[0].to_s + ", X]"
  puts
  puts
  puts "Your total is:"
  print total_cards(player_cards)
  puts
  puts
  loop do
    print "Would you like to hit or stay?"
    puts " Enter 'h' for hit or 's' for stay."
    hit_or_stay = gets.chomp.downcase
    break if hit_or_stay == 'h' || hit_or_stay == 's'
    puts
    puts "Sorry, that's not a valid choice."
    puts
  end

  while hit_or_stay == 'h'
    hit(player_cards, deck)
    puts
    puts "You have the following cards: "
    print player_cards
    puts
    puts
    puts "Your total is:"
    print total_cards(player_cards)
    puts
    puts
    if total_cards(player_cards) > 21
      total_wins_computer += 1
      puts "Bust!"
      puts
      puts "You lost!"
      puts
      break
    else
      loop do
        print "Would you like to hit or stay?"
        puts " Enter 'h' for hit or 's' for stay."
        hit_or_stay = gets.chomp.downcase
        break if hit_or_stay == 'h' || hit_or_stay == 's'
        puts
        puts "Sorry, that's not a valid choice."
        puts
      end
    end
  end

  if hit_or_stay == 's' && total_cards(player_cards) <= 21
    puts 'You chose to stay.'
    puts
    puts "Dealer has the following: "
    print dealer_cards
    puts
    puts
    puts "Dealer total is:"
    print total_cards(dealer_cards)
    puts
    puts
    while total_cards(dealer_cards) < 17
      puts "Dealer hits."
      hit(dealer_cards, deck)
      puts
      puts "Dealer has the following: "
      print dealer_cards
      puts
      puts
      puts "Dealer total is:"
      print total_cards(dealer_cards)
      puts
      puts
    end
    if total_cards(dealer_cards) >= 17 && total_cards(dealer_cards) < 22
      puts "Dealer stays."
      puts
      dealer_total = total_cards(dealer_cards)
      player_total = total_cards(player_cards)
      determine_winner(player_total, dealer_total)
      total_wins_player += 1 if player_total > dealer_total
      total_wins_computer += 1 if dealer_total > player_total
    else
      total_wins_player += 1
      puts "Dealer busts!"
      puts
      puts "You win!"
    end
    puts
  end
  break if total_wins_player > 4 || total_wins_computer > 4

  loop do
    print "Do you want to play again?"
    puts " Enter 'y' for yes or 'n' for no."
    play_again = gets.chomp.downcase
    break if play_again == 'y' || play_again == 'n'
    puts
    puts "Sorry, that's not a valid choice."
    puts
  end
  break if play_again == 'n'
end
puts
puts 'Thanks for playing Twenty-One. Goodbye.'
puts
puts
