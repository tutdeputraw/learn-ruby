class FireMonster < Monster
  def attack(monster)
    monster.burnt_attack_point = 0.4 * @attack_point
    monster.burnt_turn_total += 3

    take_damage(0.5 * monster.attack_point)

    puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals 0 damage and takes #{0.5 * monster.attack_point} damage, inflict burnt status for 3 turns with #{(0.4 * @attack_point).to_f} damage each turn"
  end
end