class Spell
  attr_reader :name, :type
  
  def initialize(name, type)
    @name = name
    @type = type
  end

  def to_s
    stat = ""
    stat += "#{@name}[#{@type}]"

    stat
  end

  def cast(monster)
    if monster.status[:name] == "burnt"
      monster.status[:turn_remaining] += 1
      puts "casts #{@name} spell on enemy's #{monster.name}"
    end
  end
  
end