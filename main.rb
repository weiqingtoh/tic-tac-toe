class Gameboard
  PLAYER_1_MARKER = 'X'.freeze
  PLAYER_2_MARKER = 'O'.freeze

  def initialize(n = 3)
    @n = n
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
