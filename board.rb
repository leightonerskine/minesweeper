require "byebug"

class Board
    attr_reader :board, :game_board

    def initialize
        @board = generate_board
        @game_board = Array.new(9){["[ ]", "[ ]", "[ ]", "[ ]", "[ ]", "[ ]", "[ ]", "[ ]", "[ ]"]}
    end



    def adjacents_values(board, adjacents_index)
        adjacents = []

        adjacents_index.each do |index|
            i, j = index
            adjacents << board[i][j]
        end 

        adjacents    
    end



    def adjacent_positions(board, position)
        x, y = position
        adjacents_index = [[x-1, y-1], [x-1, y], [x-1, y+1], [x, y-1], [x, y+1], [x+1, y-1], [x+1, y], [x+1, y+1]]

        adjacents_index.select do |index|
            i, j = index
            index if i < board.length && i >= 0  && j < board.length && j >= 0
        end         
    end



    def add_fringe_to_board(board)
        (0...board.length).each do |x|
            (0...board.length).each do |y|
                if !is_bomb?(board, [x, y])
                    neighbours = adjacent_positions(board, [x, y])
                    neighbours = adjacents_values(board, neighbours)
                    board[x][y] = neighbours.count("B") if neighbours.count("B") > 0
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
            9.times { board[i] << "_"}
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



    def adjacents_have_bomb?(neighbours_positions)
        neighbours_positions.any? do |index|
            x, y = index
            is_bomb?(@board, index)
        end
    end


    
    def clear_neighbours(position, all_neighbours = [])
        neighbours_positions = adjacent_positions(board, position)
        return if adjacents_have_bomb?(neighbours_positions)

        all_neighbours << position
        x, y = position        
        @game_board[x][y] = " #{@board[x][y]} " 

        neighbours_positions.each do |index|
            x, y = index        
            @game_board[x][y] = " #{@board[x][y]} "  
            clear_neighbours(index, all_neighbours) if !all_neighbours.include?(index)
        end
    end



    def update_user_choice(position, value)
        if value.downcase == "f"
            flag_position(position)
            true
        else
            if is_bomb?(@board, position)
                false
            else
                clear_neighbours(position)
                x, y = position
                @game_board[x][y] = " #{@board[x][y]} "
                true
            end
        end
    end



    def get_user_choice
    end

end