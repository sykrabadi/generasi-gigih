class Player
  attr_accessor :monsters
  attr_accessor :name
  
  def initialize(name, monsters)
    @name = name
    @monsters = monsters
  end

  def details
    puts "#{@name}:"
    print "#{@monsters[0]}, #{@monsters[1]}, #{@monsters[2]}"
    puts ""
  end
  
  def player_attack(player_monster, enemy_monster)
    enemy_monster.take_damage(player_monster.attack_point)
    player_monster.hitpoint -= 0.5 * enemy_monster.attack_point
    
    puts "#{@name}'s #{player_monster.name} attacks enemy's #{enemy_monster.name}, deals #{player_monster.attack_point.to_f} damage and takes #{0.5 * enemy_monster.attack_point} damage"
    puts ""
  end
end