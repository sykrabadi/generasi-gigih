require_relative 'monster'


class Fire < Monster
  
  def attack(monster)
    if @status["frozen"]
      # && @status["frozen"][0] == 1
      puts "#{@name} cannot attack the enemy"
    else
      monster.add_status("burn", 3, @attack_point)
      take_damage(0.5 * monster.attack_point)
  
      puts "#{@name} attacks enemy's #{monster.name}, 
  give burn status and takes #{0.5 * monster.attack_point} damage"
    end
  end
end