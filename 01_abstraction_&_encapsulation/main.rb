require_relative 'monstirrr'
require_relative 'player'
require_relative 'weapon'

phpkachu = Monstirrr.new('Phpkachu', 80, 50)
sqlrtle = Monstirrr.new('Sqlrtle', 100, 20)
cppmander_1 = Monstirrr.new('Cppmander', 40, 80)
cppmander_2 = Monstirrr.new('Cppmander', 40, 80)
bashtoise = Monstirrr.new('Bashtoise', 60, 60)
torterraform = Monstirrr.new('Torterraform', 120, 10)

sword = Weapon.new(attack: 30, defense: 5)
arrow = Weapon.new(attack: 20, defense: 10)
shield = Weapon.new(attack: 5, defense: 35)

player_1 = Player.new(name: "Player 1", monsters: [phpkachu, cppmander_1, torterraform])
player_2 = Player.new(name: "Player 2", monsters: [sqlrtle, cppmander_2, bashtoise])

# //////////////////////////////////////////////////////////////////////////////

puts player_1.check_status
puts player_2.check_status

puts "=======================Turn 1=======================\n\n"

puts player_1.attack(attacker: player_1.monsters[0], defender: player_2.monsters[1], weapon: [sword, arrow, shield])
puts player_1.check_status
puts player_2.check_status

puts player_2.attack(attacker: player_2.monsters[0], defender: player_1.monsters[1], weapon: [arrow, arrow])
puts player_1.check_status
puts player_2.check_status