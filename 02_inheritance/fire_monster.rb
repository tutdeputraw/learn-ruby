class FireMonster < Monster
  def attack(monster)
    take_damage(0.5 * monster.attack_point)
    monster.burn_turn += 3
    @burnt_effect.append(BurntAttackHistory.new(monster: monster))

    puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals 0 damage and takes #{0.5 * monster.attack_point} damage, inflict burnt status for 3 turns with #{(0.4 * @attack_point).to_f} damage each turn"
  end

  def execute_next_turn
    @burnt_effect.each do |record|
      if record.monster.burnt?
        record.monster.take_damage(0.4 * @attack_point)
        record.monster.burn_turn -= 1
      end
    end
  end
end