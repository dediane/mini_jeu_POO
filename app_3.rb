require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#perform methods with all the steps of the game.
def perform 
  puts "Avant de commencer, peux-tu me donner ton prénom?"
  name = gets.chomp
  game = Game.new(name)
  game.put_title
  game.show_players

  while game.is_still_ongoing?
    game.menu
    game.menu_choice
    gets.chomp
    game.enemies_attack
  end
  game.end
end

perform