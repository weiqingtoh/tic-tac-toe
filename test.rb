require './gameboard.rb'

STATE_1_TURN = [[1,0,0],[0,0,0],[0,0,0]]
STATE_2_TURNS = [[1,0,0],[0,0,0],[0,0,2]]

STATE_1_WIN_HORIZONTAL_1 = [[1,1,1],[0,0,0],[0,0,2]]
STATE_1_WIN_HORIZONTAL_2 = [[0,0,0],[1,1,1],[0,0,2]]
STATE_1_WIN_HORIZONTAL_3 = [[0,0,0],[0,2,0],[1,1,1]]

STATE_1_WIN_VERTICAL_1 = [[1,0,2],[1,2,0],[1,0,2]]
STATE_1_WIN_VERTICAL_2 = [[0,1,0],[0,1,0],[0,1,2]]
STATE_1_WIN_VERTICAL_3 = [[0,0,1],[0,2,1],[0,0,1]]

STATE_1_WIN_DIAGONAL_1 = [[1,0,0],[0,1,2],[0,0,1]]
STATE_1_WIN_DIAGONAL_2 = [[0,0,1],[0,1,2],[1,0,0]]

STATE_DRAW_1 = [[1,1,2],[2,2,1],[1,2,2]]
STATE_DRAW_2 = [[1,1,2],[0,0,0],[1,2,2]]

SAMPLE_EMPTY_3_ROW_PRINT = " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 "
SAMPLE_2_TURNS_3_ROW_PRINT = " X | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | O "

def test_gameboard_to_s
  board = Gameboard.new

  puts '== Gameboard#to_s =='
  puts "Empty Board: #{board.to_s == SAMPLE_EMPTY_3_ROW_PRINT}"

  board.instance_variable_set(:@board, STATE_2_TURNS)
  puts "2 Turns: #{board.to_s == SAMPLE_2_TURNS_3_ROW_PRINT}"
  puts
end

def test_gameboard_place_marker
  board = Gameboard.new

  puts '== Gameboard#place_marker =='
  board.place_marker(1)
  puts "Board: #{board.instance_variable_get(:@board) == STATE_1_TURN}"
  board.place_marker(9)
  puts "Board: #{board.instance_variable_get(:@board) == STATE_2_TURNS}"
  puts "Position Taken: #{board.place_marker(9) == false}"
  puts
end

def test_gameboard_get_winner
  board = Gameboard.new

  puts '== Gameboard#get_winner =='
  board.instance_variable_set(:@board, STATE_1_WIN_HORIZONTAL_1); puts "Horizontal 1: #{board.get_winner == 1}"
  board.instance_variable_set(:@board, STATE_1_WIN_HORIZONTAL_2); puts "Horizontal 2: #{board.get_winner == 1}"
  board.instance_variable_set(:@board, STATE_1_WIN_HORIZONTAL_3); puts "Horizontal 3: #{board.get_winner == 1}"

  board.instance_variable_set(:@board, STATE_1_WIN_VERTICAL_1); puts "Vertical 1: #{board.get_winner == 1}"
  board.instance_variable_set(:@board, STATE_1_WIN_VERTICAL_2); puts "Vertical 2: #{board.get_winner == 1}"
  board.instance_variable_set(:@board, STATE_1_WIN_VERTICAL_3); puts "Vertical 3: #{board.get_winner == 1}"

  board.instance_variable_set(:@board, STATE_1_WIN_DIAGONAL_1); puts "Diagonal 1: #{board.get_winner == 1}"
  board.instance_variable_set(:@board, STATE_1_WIN_DIAGONAL_2); puts "Diagonal 2: #{board.get_winner == 1}"

  board.instance_variable_set(:@board, STATE_DRAW_1); puts "Draw 1: #{board.get_winner == false}"
  board.instance_variable_set(:@board, STATE_DRAW_2); puts "Draw 2: #{board.get_winner == false}"
  puts
end

def test_gameboard_utils
  board = Gameboard.new
  player_1_name, player_2_name = 'foo', 'bar'

  board.set_first_player_name(player_1_name)
  board.set_second_player_name(player_2_name)

  puts '== Gameboard#next_player, #next_player_name =='
  puts "Player 1: #{board.next_player == 1 && board.next_player_name == player_1_name}"
  board.instance_variable_set(:@board, STATE_1_TURN)
  puts "Player 2: #{board.next_player == 2 && board.next_player_name == player_2_name}"
  puts
end

def run_tests
  test_gameboard_to_s
  test_gameboard_place_marker
  test_gameboard_get_winner
  test_gameboard_utils
end

run_tests
