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

    def initialize(player1, player2)
        @p1 = player1
        @p2 = player2
        @gameOver = false
        @winner = false
        @ava
    end

    def play
        displayRules
        displayPlayers(@p1.player, @p2.player)
        displayBoard(@@board_spaces)
    end
end