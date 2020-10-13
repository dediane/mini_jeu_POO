require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player' 

#declaring my players
player1 = Player.new("Josiane")
player2 = Player.new("José")

#loop to play the game
while player1.life_points > 0 && player2.life_points > 0
  puts "Voici l'état de chaque joueur :"
  puts ""
  player1.show_state
  player2.show_state

  puts "-------------------------------"
  puts "Passons à la phase d'attaque :"
  puts ""
  player1.attack(player2)
  if player2.life_points <= 0
    break
  end
  puts ""
  player2.attack(player1)
  puts "-------------------------------"
end


binding pry 