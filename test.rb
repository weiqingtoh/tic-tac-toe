require './main.rb'

SAMPLE_EMPTY_3_ROW_PRINT = " 1 | 2 | 3 \n-----------\n 4 | 5 | 6 \n-----------\n 7 | 8 | 9 "

def test_gameboard_to_s
  board = Gameboard.new(3)

  puts 'Testing 3 Row Printing'
  puts "Empty Board: #{board.to_s == SAMPLE_EMPTY_3_ROW_PRINT}"
end

def run_tests
  test_gameboard_to_s
end

run_tests
