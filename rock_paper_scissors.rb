def match_outcome(winner,user_play,computer_play)
  if winner == "tie"
    puts "You played #{user_play} and the computer played #{computer_play}, it's a tie!"
  else
    puts "You played #{user_play} and the computer played #{computer_play}, #{winner} wins!"
  end
end

plays_array = ["Rock","Paper","Scissors"]
plays_hash = {"P" => "Paper", "R" => "Rock", "S" => "Scissors"}

begin 
  puts "Play Rock Paper Scissors!"
  begin
    puts "Choose one: (P/R/S)"
    user_play_key = gets.chomp.capitalize!
  end while !plays_hash.has_key?(user_play_key)

  computer_play_index = rand(3)

  user_play = plays_hash[user_play_key]
  computer_play = plays_array[computer_play_index]

  case user_play
  when "Rock"
    case computer_play
    when "Rock"
      match_outcome("tie",user_play,computer_play)
    when "Paper"
      match_outcome("computer",user_play,computer_play)
    when "Scissors"
      match_outcome("user",user_play,computer_play)
    end
  when "Paper"  
    case computer_play
    when "Rock"
      match_outcome("user",user_play,computer_play)
    when "Paper"
      match_outcome("tie",user_play,computer_play)
    when "Scissors"
      match_outcome("computer",user_play,computer_play)
    end
  when "Scissors"  
    case computer_play
    when "Rock"
      match_outcome("computer",user_play,computer_play)
    when "Paper"
      match_outcome("user",user_play,computer_play)
    when "Scissors"
      match_outcome("tie",user_play,computer_play)
    end
  end

  begin
    puts "Do you want to play again? (Y/N)"
    answer = gets.chomp.capitalize!
  end while (answer != "Y") && (answer != "N")
end while answer == "Y"

puts "Thanks for playing!"




