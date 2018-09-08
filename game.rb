require './gameboard.rb'

def run_game
  n = 3
  game = Gameboard.new(n)

  puts 'Enter name for Player 1:'
  game.set_first_player_name(gets.chomp)

  puts
  puts 'Enter name for Player 2:'
  game.set_second_player_name(gets.chomp)

  puts
  puts game.to_s
  puts
  while game.in_progress? do
    puts "#{game.next_player_name}, choose a box to place an '#{game.next_player_marker}' into:"

    number = gets.chomp.to_i
    while number <= 0 || number > n**2 do
      puts "Please enter a valid number (Between 1 and #{n**2}) :"
      number = gets.chomp.to_i
    end

    puts
    if game.place_marker(number)
      puts game.to_s
    else
      puts 'Box has been taken. Please try again.'
    end
    puts
  end

  if game.get_winner_name
    puts "Congratulations #{game.get_winner_name}! You have won."
  else
    puts 'This game is a draw, thank you for playing!'
  end
end

run_game
