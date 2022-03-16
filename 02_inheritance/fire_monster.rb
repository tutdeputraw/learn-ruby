class FireMonster < Monster
  def attack(monster)
    take_damage(0.5 * monster.attack_point)

    @burnt_effect.append(BurntEffect.new(monster: monster, amount_of_turn: 3))

    puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals 0 damage and takes #{0.5 * monster.attack_point} damage, inflict burnt status for 3 turns with #{(0.4 * @attack_point).to_f} damage each turn"
  end

  def execute_next_turn
    @burnt_effect.each do |history|
      if history.amount_of_turn >= 0
        history.monster.take_damage(0.4 * @attack_point)
        history.amount_of_turn -= 1
      end
    end
  end
end