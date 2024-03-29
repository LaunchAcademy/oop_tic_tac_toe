# - Game
# - Board
# - Players
# - Spots

require_relative 'board'
require_relative 'player'

x_player = Player.new('x')
o_player = Player.new('o')

board = Board.new

players = [x_player, o_player].shuffle
turn_index = 0
while board.empty_spaces? && !board.winner?
  current_player = players[turn_index]
  puts "It is #{current_player.character} turn."

  print "What row do you want to play? "
  row_index = gets.chomp.to_i

  print "What column do you want to play? "
  col_index = gets.chomp.to_i

  board.add_turn(current_player, row_index, col_index)

  puts board.print

  turn_index = turn_index == 0 ? 1 : 0
end
