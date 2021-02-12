class TicTacToe
    WIN_COMBINATIONS = [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6], [1,4,7], [0,3,6], [2,5,8]

    def initialize
        @board=[" "," "," "," "," "," "," "," "," "]
    end
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      end

    def input_to_index(st)
        st.to_i-1
    end

    def move(index, current_player="X")
        @board[index] = current_player
    end

    def position_taken?(index)
        @board[index]== "X" || @board[index]== "O" 
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
    end

    def turn_count
        count=0
        @board.each do |index| count+=1 if index=="X" || index=="O"
        end
        count
    end

    def current_player
        if turn_count.odd?
            return "O"
        else
            return "X"
        end
    end

    def turn
        index_string=gets
        index=input_to_index(index_string)
        if !valid_move?(index) 
            index_string=gets
        else
            move(index, current_player)
            display_board
        end
    end

    def full?
        @board.all? {|index| index == "X" || index == "O"}
    end

    def over?
        if won? || draw?
            return true
        else
            return false
        end
    end
        
    def draw?
        if !won? && full?
            return true
        else
            return false
        end
    end

    def won?
        WIN_COMBINATIONS.each do |single_win_combo|
          win_index_1 = single_win_combo[0]
          win_index_2 = single_win_combo[1]
          win_index_3 = single_win_combo[2]
          
          position_1 = @board[win_index_1]
          position_2 = @board[win_index_2]
          position_3 = @board[win_index_3]
         
          if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
            return single_win_combo
          end
        end
        return false
    end
    
    def winner
        index = []
        index = won?
        if index == false
            return nil
        elsif over? == true
            if @board[index[0]] == "X"
                return "X"
            elsif @board[index[0]] == "O"
                return "O"
            end
        end
    end

    def play
        until over?
            turn
        end
        if won?
          winner == "X" || winner == "O"
          puts "Congratulations #{winner}!"
        else draw?
          puts "Cat's Game!"
        end
    end

end












