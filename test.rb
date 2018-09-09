require './gameboard.rb'
require "test/unit"

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

class TestGameboard < Test::Unit::TestCase
  def setup
    @board = Gameboard.new
  end

  def teardown; end

  def test_gameboard_to_s
    assert_equal @board.to_s, SAMPLE_EMPTY_3_ROW_PRINT

    @board.instance_variable_set(:@board, STATE_2_TURNS)
    assert_equal @board.to_s, SAMPLE_2_TURNS_3_ROW_PRINT
  end

  def test_gameboard_place_marker
    @board.place_marker(1)
    assert_equal @board.instance_variable_get(:@board), STATE_1_TURN

    @board.place_marker(9)
    assert_equal @board.instance_variable_get(:@board), STATE_2_TURNS

    assert_equal @board.place_marker(9), false
  end

  def test_gameboard_get_winner
    @board.instance_variable_set(:@board, STATE_1_WIN_HORIZONTAL_1)
    assert_equal @board.get_winner, 1
    @board.instance_variable_set(:@board, STATE_1_WIN_HORIZONTAL_2)
    assert_equal @board.get_winner, 1
    @board.instance_variable_set(:@board, STATE_1_WIN_HORIZONTAL_3)
    assert_equal @board.get_winner, 1

    @board.instance_variable_set(:@board, STATE_1_WIN_VERTICAL_1)
    assert_equal @board.get_winner, 1
    @board.instance_variable_set(:@board, STATE_1_WIN_VERTICAL_2)
    assert_equal @board.get_winner, 1
    @board.instance_variable_set(:@board, STATE_1_WIN_VERTICAL_3)
    assert_equal @board.get_winner, 1

    @board.instance_variable_set(:@board, STATE_1_WIN_DIAGONAL_1)
    assert_equal @board.get_winner, 1
    @board.instance_variable_set(:@board, STATE_1_WIN_DIAGONAL_2)
    assert_equal @board.get_winner, 1

    @board.instance_variable_set(:@board, STATE_DRAW_1)
    assert_equal @board.get_winner, false
    @board.instance_variable_set(:@board, STATE_DRAW_2)
    assert_equal @board.get_winner, false
  end

  def test_gameboard_utils
    player_1_name, player_2_name = 'foo', 'bar'

    @board.set_first_player_name(player_1_name)
    @board.set_second_player_name(player_2_name)

    assert_equal @board.next_player, 1
    assert_equal @board.next_player_name, player_1_name

    @board.instance_variable_set(:@board, STATE_1_TURN)
    assert_equal @board.next_player, 2
    assert_equal @board.next_player_name, player_2_name
  end
end
