class SpellCard
  def initialize(name, elemental_type)
    @name = name
    @elemental_type = elemental_type
  end

  def to_s
    "#{@name}[#{@elemental_type}]"
  end

  def attack(monster)
    monster.total_burnt_turn += 1

    puts "casts #{@name} spell on enemy's #{monster.name}"
  end

  def apply_effects; end
end
