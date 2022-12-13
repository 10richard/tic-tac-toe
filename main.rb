require './players.rb'
require './game.rb'

playerOne = Player.new()
playerTwo = Player.new()

playGame = Game.new(playerOne, playerTwo).play