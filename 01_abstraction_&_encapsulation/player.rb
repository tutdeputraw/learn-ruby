class Player
  attr_accessor :name
  attr_accessor :monsters

  def initialize(name:, monsters:)
    @name = name
    @monsters = monsters
  end

  def attack(weapon:, attacker:, defender:)
    "#{@name}'s #{attacker.attack(target: defender, weapon: weapon)}\n\n"
  end

  def check_status
    "#{name}:\n#{get_monster_name}\n\n"
  end

  def get_monster_name
    value = ''

    monsters.each do |monster|
      hitpoint = monster.hitpoint
      if monster.hitpoint <= 0
        hitpoint = "X"
      end

      value += "#{monster.name}[#{hitpoint}], "
    end

    value.chop.chop
  end
end
