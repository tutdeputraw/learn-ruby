require_relative 'fire_spell_card'

class SpellCard
  def initialize(name, elemental_type, spell_type = FireSpellCard)
    @name = name
    @elemental_type = elemental_type
    @spell_type = spell_type
  end

  def to_s
    "#{@name}[#{@elemental_type}]"
  end

  def attack(opponent)
    if @spell_type.attack(opponent)
      puts "casts #{@name} spell on enemy's #{opponent.name}"
    end
  end
end
