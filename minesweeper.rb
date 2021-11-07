require_relative "board"

def print_game_board(minesweeper_game)
    board =  minesweeper_game.board
    minesweeper_game.render_board(board)
    game_board =  minesweeper_game.game_board
    minesweeper_game.render_board(game_board)
end



def run_game
    minesweeper_game = Board.new
    
    print_game_board(minesweeper_game)

    position, choice = minesweeper_game.get_user_choice
    while minesweeper_game.update_user_choice(position, choice) && !minesweeper_game.game_solved?
        print_game_board(minesweeper_game)
        position, choice = minesweeper_game.get_user_choice
    end

    minesweeper_game.game_won_or_lost
end


run_game

# #testing
# minesweeper_game = Board.new
# game_board =  minesweeper_game.game_board
# minesweeper_game.render_board(game_board)

# position, choice = minesweeper_game.get_user_choice
# minesweeper_game.update_user_choice(position, choice)
# minesweeper_game.render_board(game_board)

# board =  minesweeper_game.board
# minesweeper_game.render_board(board)

