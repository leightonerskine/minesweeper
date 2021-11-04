require_relative "board"

minesweeper_game = Board.new

#testing
minesweeper_game.render_board
p minesweeper_game.is_bomb?([2, 5])
p minesweeper_game.is_bomb?([2, 7])
p minesweeper_game.is_bomb?([7, 5])