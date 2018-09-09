require './gameboard.rb'

class Game
  def initialize
    get_and_set_gameboard_size
    get_and_set_player_names
  end

  def get_and_set_gameboard_size
    puts 'Please enter the number of rows for the tic-tac-toe game (defaults to 3 if there is no input).'
    @n = gets.chomp.to_i
    @n = 3 if @n < 3
    @board = Gameboard.new(@n)
  end

  def get_and_set_player_names
    puts 'Enter name for Player 1:'
    @board.set_first_player_name(gets.chomp)
    puts

    puts 'Enter name for Player 2:'
    @board.set_second_player_name(gets.chomp)
  end

  def start
    while @board.in_progress? do
      print_board

      puts "#{@board.next_player_name}, choose a box to place an '#{@board.next_player_marker}' into:"
      number = gets.chomp.to_i

      while number <= 0 || number > @n**2 do
        puts "Please enter a valid number (Between 1 and #{@n**2}) :"
        number = gets.chomp.to_i
      end

      unless @board.place_marker(number)
        puts; puts 'Box has been taken. Please try again.'; puts
      end
    end

    print_end_of_game_message
  end

  private

  def print_board
    puts; puts @board.to_s; puts
  end

  def print_end_of_game_message
    print_board

    if @board.get_winner_name
      puts "Congratulations #{@board.get_winner_name}! You have won."
    else
      puts 'This game is a draw, thank you for playing!'
    end
  end
end

game = Game.new
game.start
