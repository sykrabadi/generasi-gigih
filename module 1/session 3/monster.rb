class Monster
  attr_reader :name, :attack_point, :status
  
  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @status = {
      name: 'neutral',
      turn_remaining: 0,
      over_time_damage: 0
    }
  end

  def to_s
    stat = ""
    stat += "#{@name}[#{@hitpoint}]" if @hitpoint > 0
    stat += "#{@name}[X]" if @hitpoint <= 0
    stat += "[#{@status[:name]}]" unless @status[:name] == 'neutral'

    stat
  end

  def attack(monster)
    unless @status[:name] == 'frozen'
      monster.take_damage(@attack_point)
      take_damage(0.5 * monster.attack_point)
  
      puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
    else
      puts "#{@name} is in frozen state, can't attack"
    end
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  def take_elemental_attack(elemental_attack)
    take_damage(elemental_attack[:initial_damage])
    @status[:name] = elemental_attack[:effect]
    @status[:turn_remaining] = elemental_attack[:turn]
    @status[:over_time_damage] = elemental_attack[:over_time_damage]
  end

  def apply_effect
    take_damage(@status[:over_time_damage])
    @status[:turn_remaining] -= 1
    
    if @status[:turn_remaining] == 0
      @status[:name] = 'neutral'
      @status[:over_time_damage] = 0
    end
  end
end
