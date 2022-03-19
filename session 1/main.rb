require_relative 'monster'
require_relative 'player'

phpkachu = Monster.new('Phpkachu', 80, 50)
sqlrtle = Monster.new('Sqlrtle', 100, 20)
cppmander = Monster.new('Cppmander', 40, 80)
bashtoise = Monster.new('Bashtoise', 60, 60)
torterraform = Monster.new('Torterraform', 120, 10)

cppmander_p1 = cppmander.clone
cppmander_p2 = cppmander.clone
phpkachu_p1 = phpkachu.clone
torterraform_p1 = torterraform.clone
sqlrtle_p2 = sqlrtle.clone
bashtoise_p2 = bashtoise.clone

# Player 1 monsters
p1_monsters = [phpkachu_p1, cppmander_p1, torterraform_p1]

# Player 2 monsters
p2_monsters = [sqlrtle_p2, cppmander_p2, bashtoise_p2]

# instantiate players
p1 = Player.new('Player 1', p1_monsters)
p2 = Player.new('Player 2', p2_monsters)

p1.details
puts ''
p2.details

puts ''
puts '=======================Turn 1======================='
puts ''

p1.player_attack(p1.monsters[0], p2.monsters[1])

p1.details
puts ''
p2.details

puts ''

p2.player_attack(p2.monsters[0], p1.monsters[1])

p1.details
puts ''
p2.details
