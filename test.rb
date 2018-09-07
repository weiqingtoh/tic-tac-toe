require './gameboard.rb'

GAME_STATE_1_TURN = [[1,0,0],[0,0,0],[0,0,0]]

SAMPLE_EMPTY_3_ROW_PRINT = " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 "

def test_gameboard_to_s
  board = Gameboard.new

  puts '== Gameboard#to_s =='
  puts "Empty Board: #{board.to_s == SAMPLE_EMPTY_3_ROW_PRINT}"
  puts
end

def test_gameboard_utils
  board = Gameboard.new
  player_1_name, player_2_name = 'foo', 'bar'

  board.set_first_player_name(player_1_name)
  board.set_second_player_name(player_2_name)

  puts '== Gameboard#next_player, #next_player_name =='
  puts "Player 1: #{board.next_player == 1 && board.next_player_name == player_1_name}"
  board.instance_variable_set(:@board, GAME_STATE_1_TURN)
  puts "Player 2: #{board.next_player == 2 && board.next_player_name == player_2_name}"
  puts
end

def run_tests
  test_gameboard_to_s
  test_gameboard_utils
end

run_tests
