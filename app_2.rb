require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "Quel est ton prénom?"
prenom = gets.chomp.to_s 
user = HumanPlayer.new("#{prenom}")

player1 = Player.new("José")
player2 = Player.new("Josiane")
enemies = Array.new
enemies << player1 
enemies << player2

def display_state(user, enemies)
  puts "Voici l'état de chaque joueur:\n"
  puts user.show_state
  print enemies[0].show_state
  print enemies[1].show_state
end

def display_user_options(enemies)
  puts "Quelle action veux-tu effectuer?\n\n"
  puts "a - chercher une meilleure arme"
  puts "b - chercher à se soigner\n\n"
  puts "attaquer un joueur en vue :\n\n"
  puts "0 - Josiane a #{enemies[1].life_points} points de vie"
  puts "1 - José a #{enemies[0].life_points} points de vie"
end 

def get_user_input(user, enemies)
  option = gets.chomp.to_s
  if option == "a"
    user.search_weapon
  elsif option == "b"
    user.search_health_pack
  elsif option == "0"
    user.attack(enemies[1])
  elsif option == "1"
    user.attack(enemies[0])
  else
    puts "Option non valide"
  end
end

puts "------------------------------"
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  display_state(user, enemies)
  puts "------------------------------"
  display_user_options(enemies)
  puts "------------------------------"
  get_user_input(user, enemies)
  puts "------------------------------"
  if enemies[0].life_points > 0 && enemies[1].life_points > 0
    puts "Les autres joueurs t'attaquent !"
    puts "-------------------------------"
    enemies.each do |player|
      if player.life_points > 0
        player.attack(user)
      end
    end
  end
end

puts "La partie est finie"
if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end






