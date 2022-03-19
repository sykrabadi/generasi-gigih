require_relative 'fire_monster'
require_relative 'ice_monster'
require_relative 'spell'
require_relative 'player'
require_relative 'monster'

phpkachu = Monster.new('Phpkachu', 120, 50)
sqlrtle = IceMonster.new('Sqlrtle', 180, 20)
cppmander = FireMonster.new('Cppmander', 100, 80)
bashtoise = IceMonster.new('Bashtoise', 120, 60)
torterraform = Monster.new('Torterraform', 200, 10)

flamethrower = Spell.new('Flamethrower', 'fire')

# add_method is compose by constructor
player1 = Player.new('Player 1')
player1.add_card(sqlrtle)
player1.add_card(cppmander)
# player1.add_monster(torterraform)
player1.add_card(flamethrower)

player2 = Player.new('Player 2')
player2.add_card(phpkachu)
player2.add_card(cppmander)
player2.add_card(bashtoise)

puts '=======================Turn 1======================='
puts ''

puts player1
puts ''

puts player2
puts ''

player1.play_turn(2, 3, player2)
puts ''

puts player1
puts ''

puts player2
puts ''

player2.play_turn(2, 1, player1)
puts ''

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 2======================='
puts ''

player1.apply_effects
player2.apply_effects

puts player1
puts ''

puts player2
puts ''

player1.play_turn(3, 3, player2)
puts ''

puts player1
puts ''

puts player2
puts ''

# We skip Player 2's turn to demonstrate that 
# because Player 1 attacks Player 2's Bashtoise with flamethrower in this turn,
# Player 2's Bashtoise burnt status will continue to turn 4
# While Player 1's Sqlrtle burnt status will stop in turn 3

puts '=======================Turn 3======================='
puts ''

player1.apply_effects
player2.apply_effects

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 4======================='
puts ''

player1.apply_effects
player2.apply_effects

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 5======================='
puts ''

player1.apply_effects
player2.apply_effects

puts player1
puts ''

puts player2
puts ''
