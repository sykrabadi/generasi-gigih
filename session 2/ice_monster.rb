require_relative 'monster'

class Ice < Monster
  
  def attack(monster)
    puts @status["frozen"] 
    # puts @status["frozen"][0] == 1
    if @status["frozen"]
      # && @status["frozen"][0] == 1
      puts "#{@name} cannot attack the enemy"
    else
      monster.take_damage(@attack_point * 0.8)
      monster.add_status("frozen", 1, 0)
      take_damage(0.5 * monster.attack_point)
  
      puts "#{@name} attacks enemy's #{monster.name}, 
  give frozen status, deals #{@attack_point * 0.8} damage, and takes #{0.5 * monster.attack_point} damage"
    end
  end
  
end