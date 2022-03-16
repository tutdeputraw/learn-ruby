class Weapon
  attr_accessor :attack
  attr_accessor :defense

  def initialize(attack:, defense:)
    @attack = attack
    @defense = defense
  end
end
