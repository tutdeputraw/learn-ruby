class FireSpellCard
  def self.attack(opponent)
    return false unless opponent.burnt?

    opponent.burnt_turn_total += 1

    return true
  end
end
