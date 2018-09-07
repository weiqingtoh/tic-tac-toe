require './gameboard.rb'

def run_game
  game = Gameboard.new
  puts 'Enter name for Player 1:'
  game.set_first_player_name(gets.chomp)

  puts 'Enter name for Player 2:'
  game.set_second_player_name(gets.chomp)

  while game.in_progress? do
    puts "#{game.next_player_name}, choose a box to place an '#{game.next_player_marker}' into:"

    gets

    puts game.to_s
  end
end

run_game
