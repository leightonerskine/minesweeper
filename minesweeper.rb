require_relative "board"

minesweeper_game = Board.new

#testing
game_board =  minesweeper_game.game_board
minesweeper_game.render_board(game_board)
minesweeper_game.update_user_choice([4,5], "F")
minesweeper_game.render_board(game_board)

board =  minesweeper_game.board
minesweeper_game.render_board(board)