class Gameboard
  PLAYER_1_MARKER = 'X'.freeze
  PLAYER_2_MARKER = 'O'.freeze

  def initialize(n = 3)
    @n = n
    @player_names = ['', '']
    @board = Array.new(n) { Array.new(n) { 0 } }
  end

  def to_s
    ans = ''
    @board.each_with_index do |row, ridx|
      row = row.map.with_index do |num, eidx|
        [idx_to_num(ridx, eidx), PLAYER_1_MARKER, PLAYER_2_MARKER][num]
      end
      ans += ' ' + row.join(' | ') + ' '
      ans += print_delimiter if ridx != (@n - 1)
    end
    ans
  end

  def set_first_player_name(name)
    @player_names[0] = name
  end

  def set_second_player_name(name)
    @player_names[1] = name
  end

  def in_progress?
    @board.flatten.count(0) >= 1
  end

  def next_player
    @board.flatten.count(0) % 2 == 1 ? 1 : 2
  end

  def next_player_name
    @player_names[next_player - 1]
  end

  def next_player_marker
    next_player == 1 ? PLAYER_1_MARKER : PLAYER_2_MARKER
  end

  private

  # Given the row and element index, return the board number.
  def idx_to_num(row, element)
    1 + element + (@n * row)
  end

  # Given the board number, return the row and element index.
  # Returns an array with shape: [row_index, element_index]
  def num_to_idx(num)
    [(num - 1) / @n, (num - 1) % @n]
  end

  def print_delimiter
    "\n" + '-' * ((4 * @n) - 1) + "\n"
  end
end
