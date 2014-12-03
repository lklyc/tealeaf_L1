require 'pry'

# initialize game board
board = {1 => "1",2 => "2",3 => "3",4 => "4",5 => "5",6 => "6",7 => "7",8 => "8",9 => "9"}

possible_wins = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

def draw_board(board)
  system 'clear'
  puts
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts
end

def check_win(plays,possible_wins)

  possible_wins.each do |v|

    if (plays.include?(v[0])) && (plays.include?(v[1])) && (plays.include?(v[2]))
      return true
    else
      return false
    end

  end

end

draw_board(board)
win_status = "tie"

begin

  puts "Choose a position (from 1 to 9) to place a piece:"
  user_selection = gets.chomp.to_i

  board[user_selection] = "X"

  # find empty slots
  empty_board_slots = board.select {|k,v| (v != "X") && (v != "Y")}
  # put slot numbers into array
  empty_slots = empty_board_slots.keys
  if empty_slots.empty?
    break
  end
  # draw random number between 0 and length of empty_slots - 1
  ai_index = rand(empty_slots.count)
  ai_selection = empty_slots[ai_index]
  board[ai_selection] = "O"

  draw_board(board)

  # extract plays to evaluate for wins
  user_plays = board.select {|k,v| v == "X"}.keys
  ai_plays = board.select {|k,v| v == "O"}.keys
  # update win status
  if user_plays.count >= 3
    possible_wins.each do |v|

      if (user_plays.include?(v[0])) && (user_plays.include?(v[1])) && (user_plays.include?(v[2]))
        win_status = "user"
        break
      end

    end
  end

  if user_plays.count >= 3
    possible_wins.each do |v|

      if (ai_plays.include?(v[0])) && (ai_plays.include?(v[1])) && (ai_plays.include?(v[2]))
        win_status = "user"
        break
      end
    end
  end



end while win_status == "tie"

puts win_status


