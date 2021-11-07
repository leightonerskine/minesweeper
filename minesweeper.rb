require_relative "board"

def run_game
    minesweeper_game = Board.new
    
    minesweeper_game.render_board(minesweeper_game.game_board)

    position, choice = minesweeper_game.get_user_choice
    while minesweeper_game.update_user_choice(position, choice) && !minesweeper_game.game_solved?
        minesweeper_game.render_board(minesweeper_game.game_board)
        position, choice = minesweeper_game.get_user_choice
    end

    minesweeper_game.render_board(minesweeper_game.board)
    minesweeper_game.game_won_or_lost    
end


run_game


