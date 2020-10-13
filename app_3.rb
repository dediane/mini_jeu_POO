require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#perform methods with all the steps of the game.
def perform 
  puts "Avant de commencer, peux-tu me donner ton prénom?"
  name = gets.chomp
  my_game = Game.new(name)
  my_game.put_title
  my_game.show_players

  while my_game.is_still_ongoing?
    my_game.menu
    print "> "
    option = gets.chomp.to_s
    my_game.menu_choice(option)
    gets.chomp
    my_game.enemies_attack
  end
  my_game.end
end

perform