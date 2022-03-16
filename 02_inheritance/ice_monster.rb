class IceMonster < Monster
  def attack(monster)
    monster.take_damage(0.8 * @attack_point)
    monster.frozen_turn += 1

    take_damage(0.5 * monster.attack_point)

    puts "#{@name} uses elemental attack on enemy's #{monster.name}, deals #{(0.8 * @attack_point).to_f} damage and takes #{0.5 * monster.attack_point} damage, inflict frozen status for 1 turns with 0 damage each turn"
  end

  def execute_next_turn
    if frozen?
      @frozen_turn -= 1
    end
  end
end