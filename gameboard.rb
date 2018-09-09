class Gameboard
  PLAYER_1_MARKER = 'X'.freeze
  PLAYER_2_MARKER = 'O'.freeze

  # Set up instance variables. Board tracks the state of the game.
  # For the board array:
  #   - 0 means empty,
  #   - 1 means marker placed by player 1,
  #   - 2 is marker placed by player 2
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

  # Place marker given position in Tic-Tac-Toe board.
  # Returns false if position is already taken
  # Returns true if position update is successful
  def place_marker(position)
    indexes = num_to_idx(position)
    return false if @board[indexes[0]][indexes[1]] != 0
    @board[indexes[0]][indexes[1]] = next_player
    true
  end

  def set_first_player_name(name)
    @player_names[0] = name
  end

  def set_second_player_name(name)
    @player_names[1] = name
  end

  def in_progress?
    has_empty_boxes && !get_winner
  end

  def get_winner_name
    winner = get_winner
    return false unless winner
    @player_names[winner - 1]
  end

  def next_player
    (@n**2 - @board.flatten.count(0)) % 2 == 0 ? 1 : 2
  end

  def next_player_name
    @player_names[next_player - 1]
  end

  def next_player_marker
    next_player == 1 ? PLAYER_1_MARKER : PLAYER_2_MARKER
  end

  # Checks for the winner of the tic-tac-toe.
  #
  # Returns:
  #   - false for a draw
  #   - 1, if player 1 wins
  #   - 2, if player 2 wins.
  def get_winner
    indexes_to_check = (0..@n-3).to_a

    # Check horizontal winners
    @board.each_with_index do |_, k|
      indexes_to_check.each do |idx|
        return @board[k][idx] if marked(k, idx) && similar_value([k, idx], [k, idx + 1], [k, idx + 2])
      end
    end

    # Check vertical winners
    @n.times do |k|
      indexes_to_check.each do |idx|
        return @board[idx][k] if marked(idx, k) && similar_value([idx, k], [idx + 1, k], [idx + 2, k])
      end
    end

    # Check diagonal winners
    indexes_to_check.product(indexes_to_check).each do |idx1, idx2|
      if marked(idx1, idx2) && similar_value([idx1, idx2], [idx1 + 1, idx2 + 1], [idx1 + 2, idx2 + 2])
        return @board[idx1][idx2]
      elsif marked(idx1, idx2 + 2) && similar_value([idx1, idx2 + 2], [idx1 + 1, idx2 + 1], [idx1 + 2, idx2])
        return @board[idx1][idx2+2]
      end
    end

    false
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

  def has_empty_boxes
    @board.flatten.count(0) >= 1
  end

  # Returns true if row and position is marked by player 1 or 2, otherwise return false
  def marked(row, pos)
    @board[row][pos] != 0
  end

  # Checks board if coordinates for a, b, c are similar.
  #
  # Returns true if elements in a, b and c are similar, otherwise false
  def similar_value(a, b, c)
    @board[a[0]][a[1]] == @board[b[0]][b[1]] && @board[b[0]][b[1]] == @board[c[0]][c[1]]
  end
end
