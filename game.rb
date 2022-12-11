require './display.rb'

class Game
    include Display

    attr_accessor :gameOver, :winner

    @@board_spaces = {
        1 => '1',
        2 => '2',
        3 => '3',
        4 => '4',
        5 => '5',
        6 => '6',
        7 => '7', 
        8 => '8',
        9 => '9'
    }

    @@available_spaces = @@board_spaces.values
    @@p1_choices = []
    @@p2_choices = []

    def initialize(player1, player2)
        @p1 = player1
        @p2 = player2
        @gameOver = false
        @winner = false
    end

    def play
        displayRules
        displayPlayers(@p1.player, @p2.player)
        puts
        currentPlayer = @p1
        
        until gameOver
            displayBoard(@@board_spaces)
            puts "#{currentPlayer.player}'s turn"
            move = checkMove(getMove)
            @@board_spaces[move.to_i] =  currentPlayer == @p1 ? 'X' : 'O'
            
            @gameOver = true
        end
    end

    def getMove
        move = gets.chomp
        return move
    end

    def checkMove(move)
        if @@available_spaces.include?(move)
            @@available_spaces.delete(move)
        else
            puts "You did not enter an open space on the board"
            puts "Please try again."
            getMove
        end
    end
end