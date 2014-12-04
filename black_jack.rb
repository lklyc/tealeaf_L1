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
  puts ">> #{msg}"
end

# initialize deck
deck = ["A",2,3,4,5,6,7,8,9,10,"J","Q","K","A",2,3,4,5,6,7,8,9,10,"J","Q","K","A",2,3,4,5,6,7,8,9,10,"J","Q","K","A",2,3,4,5,6,7,8,9,10,"J","Q","K"]

# initialize hands
user_hand = []
dealer_hand = []
# initialize whether dealer needs to play
bust_or_blackjack = false
# deal 2 cards to user
user_hand << deal_card(deck)
user_hand << deal_card(deck)
say("Here's your hand " + user_hand.to_s + "which adds up to " + calculate_sum(user_hand).to_s)
begin

  # Ask for decision
  say("What you sayin'? (H/S)")
  user_play = gets.chomp.upcase!
  # deal card if user wants hit
  if user_play == "H"
    user_hand << deal_card(deck)
    say("Here's your hand " + user_hand.to_s + "which adds up to " + calculate_sum(user_hand).to_s)
  end
  # check for blackjack or bust
  if calculate_sum(user_hand) == 21
    say("BLACKJACK!! You win")
    bust_or_blackjack = true
    break
  elsif calculate_sum(user_hand) > 21
    say("BUSTED!! You lose")
    bust_or_blackjack = true
    break
  end

end while user_play == "H"





