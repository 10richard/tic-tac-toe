class Player
    attr_accessor :player

    @@count = 1

    def initialize
        puts "Player #{@@count} name:"
        @player = gets.chomp
        @@count += 1
    end
end