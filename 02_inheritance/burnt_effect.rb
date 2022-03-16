class BurntEffect
  attr_accessor :monster, :amount_of_turn

  def initialize(monster:, amount_of_turn:)
    @monster = monster
    @amount_of_turn = amount_of_turn
  end
end