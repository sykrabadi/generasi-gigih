class Monster
  attr_reader :name, :attack_point
  
  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @status = {}
  end

  def to_s
    if @hitpoint > 0
      "#{@name}[#{@hitpoint}]"
    else
      "#{@name}[X]"
    end
  end

  def attack(monster)
    if @status["frozen"]
      # && @status["frozen"][0] == 1
      puts "#{@name} cannot attack the enemy"
    else
      monster.take_damage(@attack_point)
      take_damage(0.5 * monster.attack_point)
  
      puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
      
    end
    
    
  end

  def burn()
    temp = @status["burn"][1] * 0.4 
    take_damage(temp)
  end

  # def frozen()
  #   take_damage(temp)
  # end

  def update_duration()
    @status.each do |key, value|
      @status[key][0] -= 1
    end
  end

  def add_status(condition, duration, damage)
    @status[condition] = [duration, damage]
  end

  def cek_stat()
    @status.each do |key, value|
      
      if @status[key][0] == 0
        @status.delete(key)
      elsif key == "burn" 
        # && @status[key][0] < 4
        burn()
      
      end
    end
    # puts @status
  end
  
  def take_damage(amount)
    @hitpoint -= amount
  end
end