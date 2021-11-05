require_relative "board"

def print_game_board(minesweeper_game)
    game_board =  minesweeper_game.game_board
    minesweeper_game.render_board(game_board)
end



def run_game
    minesweeper_game = Board.new
    
    print_game_board(minesweeper_game)

    position, choice = minesweeper_game.get_user_choice
    while minesweeper_game.update_user_choice(position, value) && !minesweeper_game.game_solved?
        print_game_board(minesweeper_game)
        position, choice = minesweeper_game.get_user_choice
    end

    minesweeper_game.game_won_or_lost
end

#testing
minesweeper_game = Board.new
game_board =  minesweeper_game.game_board
minesweeper_game.render_board(game_board)

radom_bomb_x = rand(game_board.length - 1)
radom_bomb_y = rand(game_board.length - 1)
minesweeper_game.update_user_choice([radom_bomb_x, radom_bomb_y], "F")
minesweeper_game.render_board(game_board)

board =  minesweeper_game.board
minesweeper_game.render_board(board)

radom_bomb_x = rand(game_board.length - 1)
radom_bomb_y = rand(game_board.length - 1)
minesweeper_game.update_user_choice([radom_bomb_x, radom_bomb_y], "")
minesweeper_game.render_board(game_board)
