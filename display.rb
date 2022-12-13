module Display
    def displayBoard(board_spaces)
        puts "#{board_spaces[1]} | #{board_spaces[2]} | #{board_spaces[3]}"
        puts "#{board_spaces[4]} | #{board_spaces[5]} | #{board_spaces[6]}"
        puts "#{board_spaces[7]} | #{board_spaces[8]} | #{board_spaces[9]}"
    end

    def displayPlayers(player1, player2)
        puts "#{player1} is 'X'"
        puts "#{player2} is 'O'"
    end

    def displayRules
        puts
        puts "<Enter a number corresponding to an available space on the board>"
    end

    def displayTie
        puts
        puts "It's a tie! Nobody won."
    end

    def displayWinner(player)
        puts
        puts "#{player} won!"
    end
end