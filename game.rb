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
        @@move = nil
        @@currentPlayer = @p1
    end

    def play
        displayRules
        displayPlayers(@p1.player, @p2.player)
        puts
        displayBoard(@@board_spaces)
        
        until @gameOver
            puts
            puts "#{@@currentPlayer.player}'s turn: "
            until @@move
                @@move = getMove
                checkMove(@@move)
            end
            @@board_spaces[@@move.to_i] =  @@currentPlayer == @p1 ? 'X' : 'O'
            displayBoard(@@board_spaces)
            if @@currentPlayer == @p1
                @@p1_choices.push(@@move.to_i)
            else
                @@p2_choices.push(@@move.to_i)
            end
            checkWinner
            checkTie
            @@move = false
            @@currentPlayer = @@currentPlayer == @p1 ? @p2 : @p1
        end
        if @winner == @p1
            displayWinner(@p1.player)
        elsif @winner == @p2
            displayWinner(@p2.player)
        end
    end

    def getMove
        @@move = gets.chomp
        return @@move
    end

    def checkMove(move)
        if @@available_spaces.include?(move)
            @@available_spaces.delete(move)
        else
            puts "You did not enter an open space on the board"
            puts "Please try again."
            @@move = false
        end
    end

    def checkTie
        if @@available_spaces.empty?
            @gameOver = true
            displayTie
        end
    end

    def checkWinner
        winning_combos = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
            [0, 3, 6],
            [1, 4, 7],
            [2, 5, 8],
            [1, 5, 9],
            [3, 5, 7]
        ]
        if @@currentPlayer == @p1
            @@p1_choices.sort
            winning_combos.each do |lst|
                match = @@p1_choices & lst
                if match == lst
                    @gameOver = true
                    @winner = @p1
                end
            end
        else
            @@p2_choices.sort
            winning_combos.each do |lst|
                match = @@p2_choices & lst
                if match == lst
                    @gameOver = true
                    @winner = @p2
                end
            end
        end
    end
end