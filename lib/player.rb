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