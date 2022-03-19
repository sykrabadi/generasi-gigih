require_relative 'player'
require_relative 'monster'
require_relative 'fire_monster'
require_relative 'ice_monster'

phpkachu = Monster.new('Phpkachu', 120, 50)
sqlrtle = Ice.new('Sqlrtle', 180, 20)
cppmander = Fire.new('Cppmander', 100, 80)
bashtoise = Ice.new('Bashtoise', 120, 60)
torterraform = Monster.new('Torterraform', 200, 10)

player1 = Player.new('Player 1')
player1.add_monster(sqlrtle)
player1.add_monster(cppmander)
player1.add_monster(torterraform)

player2 = Player.new('Player 2')
player2.add_monster(phpkachu)
player2.add_monster(cppmander)
player2.add_monster(bashtoise)

puts '=======================Turn 1======================='
puts ''

player1.checking()
player2.checking()

puts player1
puts ''

puts player2
puts ''

player1.play_turn(2, 1, player2)
puts ''

puts player1
puts ''

puts player2
puts ''

player2.play_turn(2, 3, player1)
puts ''

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 2======================='
puts ''

player1.checking()
player2.checking()

# starting in turn 2, in the beginning of each turn, apply elemental effects to players' monsters here
# player1.your_new_method_here
# player2.your_new_method_here

puts player1
puts ''

puts player2
puts ''

player1.play_turn(1, 3, player2)
puts ''

puts player1
puts ''

puts player2
puts ""

player2.play_turn(3, 2, player1)
puts ''

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 3======================='
puts ''

# player1.your_new_method_here
# player2.your_new_method_here
player1.checking()
player2.checking()

puts player1
puts ''

puts player2
puts ''

puts '=======================Turn 4======================='
puts ''

# player1.your_new_method_here
# player2.your_new_method_here
player1.checking()
player2.checking()

puts player1
puts ''

puts player2
puts ''