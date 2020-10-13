require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Methods that shows the state of the user and the enemies
def display_state(user, enemies)
  puts "Voici l'état de chaque joueur:\n"
  puts user.show_state
  print enemies[1].show_state
  print enemies[0].show_state
end

#Methods that display the options of the user
def display_user_options(enemies)
  puts "Quelle action veux-tu effectuer?\n\n"
  puts "a - chercher une meilleure arme"
  puts "b - chercher à se soigner\n\n"
  puts "attaquer un joueur en vue :\n\n"
  if enemies[1].life_points  == 0
    puts "0 - Josiane est morte, elle n'a plus de points de vie"
  else
    puts "0 - Josiane a #{enemies[1].life_points} points de vie"
  end
  if enemies[0].life_points == 0
    puts "1 - José est mort, il n'a plus de points de vie"
  else
    puts "1 - José a #{enemies[0].life_points} points de vie"
  end
end 

#Methods that ask the user for an input
def get_user_input(user, enemies)
  option = gets.chomp.to_s
  while (option != "a" && option != "b" && option != "1" && option != "0")
    puts "Option non valide"
    option = gets.chomp.to_s
  end
  if option == "a"
    user.search_weapon
  elsif option == "b"
    user.search_health_pack
  elsif option == "0"
    user.attack(enemies[1])
  elsif option == "1"
    user.attack(enemies[0])
  end
end

#Method that perform the game
def perform
  puts "------------------------------------------------"
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts "------------------------------------------------"

  puts "Quel est ton prénom?"
  prenom = gets.chomp.to_s              #initialize
  user = HumanPlayer.new("#{prenom}")   #user

  #initialize array of players
  player1 = Player.new("José")
  player2 = Player.new("Josiane")
  enemies = Array.new
  enemies << player1 
  enemies << player2

  #loop of the game
  puts "______________________________________________________"
  while user.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points > 0)
    display_state(user, enemies)
    puts "Appuyez sur entrée pour continuer:"
    gets.chomp
    puts "______________________________________________________"
    display_user_options(enemies)
    puts "______________________________________________________"
    get_user_input(user, enemies)
    puts "______________________________________________________"
    if enemies[0].life_points > 0 && enemies[1].life_points > 0
      puts "Les autres joueurs t'attaquent !"
      puts "Appuyez sur entrée pour continuer:"
      gets.chomp
      puts "______________________________________________________"
      enemies.each do |player|
         if player.life_points > 0
          player.attack(user)
          puts "______________________________________________________"
          puts ""
        end
      end
    end
    puts "Appuyez sur entrée pour continuer:"
      gets.chomp
  end
  
  #display the end of the game with the winner
  puts "La partie est finie"
  if user.life_points > 0
    puts "BRAVO ! TU AS GAGNE !"
  else
    puts "Loser ! Tu as perdu !"
  end
end

perform





