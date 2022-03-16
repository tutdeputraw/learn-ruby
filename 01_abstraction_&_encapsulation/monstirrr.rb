class Monstirrr
  attr_accessor :name
  attr_accessor :attack_point
  attr_accessor :hitpoint

  def initialize(name, hitpoint, attack_point)
    @name = name
    @hitpoint = hitpoint
    @attack_point = attack_point
  end

  def attack(target:, weapon:)
    if target.hitpoint - @attack_point + calculate_attack_point(weapon) >= 0 && target.hitpoint != "X"
      target.hitpoint -= @attack_point + calculate_attack_point(weapon)
    else
      target.hitpoint = "X"
    end

    take_damage(0.5 * target.attack_point - calculate_defense_point(weapon))

    "#{@name} attacks enemy's #{target.name}, deals #{@attack_point + calculate_attack_point(weapon)} damage and takes #{0.5 * target.attack_point - calculate_defense_point(weapon)} damage"
  end

  def calculate_attack_point(weapons)
    value = 0

    weapons.each do |weapon|
      value += 0.5 * weapon.attack
    end

    value
  end

  def calculate_defense_point(weapons)
    value = 0

    weapons.each do |weapon|
      value += weapon.defense
    end

    value
  end

  def take_damage(amount)
    @hitpoint -= amount
  end

  def to_s
    if @hitpoint > 0
      "#{@name}[#{@hitpoint}]"
    else
      "#{@name}[X]"
    end
  end
end
