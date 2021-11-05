require "byebug"

class Board
    attr_reader :board, :game_board

    def initialize
        @board = generate_board
        @game_board = Array.new(9){["[ ]", "[ ]", "[ ]", "[ ]", "[ ]", "[ ]", "[ ]", "[ ]", "[ ]"]}
    end



    def adjacent_cells(board, position)
        x, y = position
        adjacents_index = [[x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1], [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]]
        adjacents = []

        adjacents_index.each do |index|
            i, j = index
            if i < board.length && j < board.length
                adjacents << board[i][j] if i >= 0 && j >= 0
            end
        end     

        adjacents
    end



    def add_fringe_to_board(board)
        (0...board.length).each do |x|
            (0...board.length).each do |y|
                if !is_bomb?(board, [x, y])
                    adjacents = adjacent_cells(board, [x, y])
                    board[x][y] = adjacents.count("B") if adjacents.count("B") > 0
                end
            end
        end
        board
    end


    
    def add_bombs_to_board(board)
        while board.flatten.count("B") < 10
            radom_bomb_x = rand(board.length - 1)
            radom_bomb_y = rand(board.length - 1)            
            board[radom_bomb_x][radom_bomb_y] = "B"
        end

        add_fringe_to_board(board)
    end



    def generate_board 
        board = Array.new(9){[]}
        (0...9).each do |i|
            9.times { board[i] << ""}
        end

        add_bombs_to_board(board)
    end



    def render_board(board)
        puts "\n\n"
        puts "      0   1   2   3   4   5   6   7   8 \n\n\n"
        board.each_with_index do |row, i|
            print "#{i}    "
            row.each_with_index do |ele, j|
                print "#{ele} "
            end
            puts "\n\n"
        end
        puts "\n\n"
    end



    def is_bomb?(board, position)
        x, y = position
        return board[x][y] == "B"
    end



    def flag_position(position)
        x, y = position
        @game_board[x][y] = "|F|"
    end



    def update_user_choice(position, value)
        if value.downcase == "f"
            flag_position(position)
            true
        else
            if is_bomb?(@board, position)
                false
            else
                count_of_adjacent_bombs(position)
                true
            end
        end
    end



    def get_user_choice
    end

end