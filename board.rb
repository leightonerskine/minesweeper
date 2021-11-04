

class Board
    def initialize
        @board = generate_board
        @game_board = Array.new(9){["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"]}
    end


    
    def add_bombs_to_board(board)
        while board.flatten.count("B") < 10
            radom_bomb_x = rand(board.length - 1)
            radom_bomb_y = rand(board.length - 1)            
            board[radom_bomb_x][radom_bomb_y] = "B"
        end
        board
    end



    def generate_board 
        board = Array.new(9){[]}
        (0...9).each do |i|
            9.times { board[i] << ""}
        end

        add_bombs_to_board(board)
    end
end