require 'pry'

def deal_card(deck)
  # select random position
  card_position = rand(deck.count)
  # draw card
  card = deck[card_position]
  # remove card from deck
  deck.delete_at(card_position)
  # return the card
  return card
end

def calculate_sum(hand)

  sum = 0
  num_A = 0

  hand.each do |c|
    if ["J","Q","K"].include?(c)
      c = 10
    elsif c == "A"
      num_A += 1
      next
    end

    sum += c
  end

  if num_A > 0
    num_A.times do
      if sum + 11 > 21
        sum += 1
      else
        sum += 11
      end
    end
  end

  return sum

end
  
def say(msg)
  puts ">>>>> #{msg}"
end

system 'clear'
# initialize deck
deck = ["A",2,3,4,5,6,7,8,9,10,"J","Q","K","A",2,3,4,5,6,7,8,9,10,"J","Q","K","A",2,3,4,5,6,7,8,9,10,"J","Q","K","A",2,3,4,5,6,7,8,9,10,"J","Q","K"]

# initialize hands
user_hand = []
dealer_hand = []
# initialize whether dealer needs to play
bust_or_blackjack = false
winner = nil
# deal 2 cards to user and dealer
user_hand << deal_card(deck)
user_hand << deal_card(deck)

dealer_hand << deal_card(deck)
dealer_hand << deal_card(deck)

say("Here's dealer's first card " + dealer_hand.first.to_s)
say("Here's your hand " + user_hand.to_s + "which adds up to " + calculate_sum(user_hand).to_s)

# check blackjack
if calculate_sum(user_hand) == 21
    say("BLACKJACK!!")
    bust_or_blackjack = true
    winner = "user"
end
# play out user's hand
begin
  # skip entire section if blackjack
  break if bust_or_blackjack
  # Ask for decision
  say("What you sayin'? (H/S)")
  user_play = gets.chomp.upcase!
  # deal card if user wants hit
  if user_play == "H"
    user_hand << deal_card(deck)
    say("Here's your hand " + user_hand.to_s + "which adds up to " + calculate_sum(user_hand).to_s)
  end
  # check for blackjack or bust, keep track of whether a dealer's hand is necessary
  if calculate_sum(user_hand) == 21
    say("BLACKJACK!!")
    bust_or_blackjack = true
    winner = "user"
    break
  elsif calculate_sum(user_hand) > 21
    say("BUSTED!!")
    bust_or_blackjack = true
    winner = "dealer"
    break
  end

end while user_play == "H"

# if player didn't bust or get blackjack
if !bust_or_blackjack

  say("The dealer's hand is " + dealer_hand.to_s + "which adds up to " + calculate_sum(dealer_hand).to_s)

  if calculate_sum(dealer_hand) == 21
    say("BLACKJACK!!")
    winner = "dealer"
  else
    begin
      say("Dealer will hit...(hit enter to continue)")
      gets
      dealer_hand << deal_card(deck)
      say("The dealer's hand is " + dealer_hand.to_s + "which adds up to " + calculate_sum(dealer_hand).to_s)

      if calculate_sum(dealer_hand) == 21
        say("BLACKJACK!!")
        winner = "dealer"
        break
      elsif calculate_sum(dealer_hand) > 21
        say("BUSTED!!")
        winner = "user"
        break
      end

    end while calculate_sum(dealer_hand) < 17
    say("Dealer reached 17, will stay...") if !bust_or_blackjack
  end
end

if bust_or_blackjack
  say("Winner is #{winner}")
elsif calculate_sum(user_hand) == calculate_sum(dealer_hand)
  say("It's a draw... you get your money back")
else
  winner = calculate_sum(user_hand) > calculate_sum(dealer_hand)? "user" : "dealer"
  say("Winner is #{winner}")
end

say("#{user_hand.count + dealer_hand.count} cards dealt... #{deck.count} cards remaining")







