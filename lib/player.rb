class Player

  attr_accessor :name, :life_points

  #initialize a player
  def initialize(name)
    @name = name 
    @life_points = 10
  end

  #show how manies life points the player has left
  def show_state
    puts "#{self.name} a #{self.life_points} points de vie."
  end

  #Inflict damages on a player
  def gets_damage(value)
    self.life_points -= value
    if self.life_points <= 0
      puts "Le joueur #{self.name} a été tué!"
    end
  end

  #Inflict damages on a player passed in argument and displays actions
  def attack(player)
    puts "le joueur #{self.name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "Il lui inflige #{damage} points de dommages"
    player.gets_damage(damage)
    
  end

  #Return a random damage number between 1 and 6
  def compute_damage
    return rand(1..6)
  end
end


class HumanPlayer

  attr_accessor :name, :life_points, :weapon_level

  #initialize a Human Player 
  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  #Display HumanPlayer name, points of life and weapon level 
  def show_state
    puts "#{HumanPlayer.name} a #{HumanPlayer.life_points} points de vie et une arme de niveau #{HumanPlayer.weapon_level}." 
  end

  #Give a random damage value multiplicated by the weapon level
  def compute_damage
    rand(1..6) * @weapon_level
  end

  #Method that change the weapon_level if the one we find randomly is superior to the original one.
  def search_weapon
    weapon = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon}"
      if weapon > self.weapon_level
        self.weapon_level = weapon
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
      else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé... "
    elsif health_pack > 1 && health_pack < 6
      self.life_points += 50
      self.life_points = 100 if self.life_points > 100
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else
      self.life_points += 80
      self.life_points = 100 if self.life_points > 100
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end
end