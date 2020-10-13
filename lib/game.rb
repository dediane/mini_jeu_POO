class Game 
  
  attr_accessor :human_player, :enemies
  
  #initialize the game
  def initialize(name)
    @enemies = Array.new
    4.times {|player| @enemies << Player.new("player#{player}")}
    @human_player = HumanPlayer.new(name)
  end

  #puts a pretty title when you lunch the game
  def put_title
    puts "------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "------------------------------------------------"
    puts ""
  end

  
  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && @enemies.size > 0
  end

  def show_players
    puts "Le joueur #{@human_player.name} a #{@human_player.life_points} points de vie."
    puts "Il reste #{@enemies.size} bots-player. "
    
  end

  #display the menu of the game
  def menu
    @human_player.show_state
    @enemies.size.times do |player|
      enemies[player].show_state
    end
    puts ""
    puts "Quelle action veux-tu effectuer?"
    puts "---------------------------------------"
    puts "a - chercher une meilleure arme"
    puts "b - chercher à se soigner\n\n"
    puts "Attaquer un joueur en vue :"
    puts "---------------------------------------"
    @enemies.each.with_index do |player, i|
      puts "#{i} - attaquer #{player.name} qui a #{player.life_points} points de vie."
    end
    puts ""
  end

  #method to get the input from the user to select the game option.
  def menu_choice(option)
    puts ""
    if option == "a"
      @human_player.search_weapon
    elsif option == "b"
      @human_player.search_health_pack
    elsif
      @enemies.each.with_index do |player, i|
        if option == i.to_s
          @human_player.attack(enemies[i])
          if @enemies[i].life_points <= 0
            kill_player(@enemies[i])
          end
        end
      end 
    end
  end

  def enemies_attack
    puts "-------------------------------------"
    @enemies.each do |enemy|
      enemy.attack(@human_player)
      puts ""
    end
  end

  def end
    puts "La partie est finie!"
    if @human_player.life_points == 0
      puts "Loser ! Tu as perdu !"
    else
      puts "BRAVO ! TU AS GAGNE !"
    end
  end
end