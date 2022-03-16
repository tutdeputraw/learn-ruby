require_relative 'burnt_effect'

class Monster
  attr_reader :name, :attack_point
  attr_accessor :burnt_effect, :frozen_turn, :hitpoint

  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
    @burnt_effect = []
    @frozen_turn = -1
  end

  def to_s
    if @hitpoint > 0
      "#{@name}[#{@hitpoint}]"
    else
      "#{@name}[X]"
    end
  end

  def attack(monster)
    monster.take_damage(@attack_point)
    take_damage(0.5 * monster.attack_point)

    puts "#{@name} attacks enemy's #{monster.name}, deals #{@attack_point.to_f} damage and takes #{0.5 * monster.attack_point} damage"
  end

  def frozen?
    @frozen_turn >= 0
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  def execute_next_turn; end

end