require_relative "board"

minesweeper_game = Board.new

#testing
minesweeper_game.render_board
minesweeper_game.update_user_choice([4,5], "F")
minesweeper_game.render_board