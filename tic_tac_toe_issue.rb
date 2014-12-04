require 'pry'

# initialize game board
board = {1 => "1",2 => "2",3 => "3",4 => "4",5 => "5",6 => "6",7 => "7",8 => "8",9 => "9"}

possible_wins =   {1 => [1,2,3],
                   2 => [4,5,6],
                   3 => [7,8,9],
                   4 => [1,4,7],
                   5 => [2,5,8],
                   6 => [3,6,9],
                   7 => [1,5,9],
                   8 => [3,5,7]}

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

  possible_wins.each_value do |v|
    
    if (plays.include?(v[0])) && (plays.include?(v[1])) && (plays.include?(v[2]))
      return true
    end

  end

  return false

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
    if check_win(user_plays,possible_wins)
      win_status = "user"
    elsif check_win(ai_plays,possible_wins)
      win_status = "ai"
    end
  end

end while win_status == "tie"

puts win_status


