

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



    def render_board
        puts "\n\n"
        puts "      0  1  2  3  4  5  6  7  8 \n\n\n"
        @game_board.each_with_index do |row, i|
            print "#{i}    "
            row.each_with_index do |ele, j|
                print "#{ele} "
            end
            puts "\n\n"
        end
        puts "\n\n"
    end



    def is_bomb?(position)
        x, y = position
        return @board[x][y] == "B"
    end



    def flag_position(position)
    end



    def update_user_choice(position, value)
        if value.downcase == "f"
            flag_position(position)
        # else
        #     if is_bomb?(position)
        #         false
        #     else

        #     end
        end
    end



    def get_user_choice
    end

end