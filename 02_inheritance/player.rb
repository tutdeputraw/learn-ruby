class Player
  attr_reader :monsters

  def initialize(name)
    @name = name
    @monsters = []
  end

  def add_monster(monster)
    monsters << monster.dup
  end

  def to_s
    result = "#{@name}:\n"

    @monsters.each_with_index do |monster, index|
      result += monster.to_s
      if index < @monsters.size - 1
        result += ', '
      else
        result += "\n"
      end
    end

    result
  end

  def play_turn(own_card, opponent_card, opponent)
    own_card_ = @monsters[own_card - 1]
    opponent_card_ = opponent.monsters[opponent_card - 1]

    print "#{@name}'s "

    if own_card_.frozen?
      puts "#{own_card_.name} is in frozen state, can't attack"
      return
    end

    own_card_.attack(opponent_card_)
  end

  def update_turn
    monsters.each do |monster|
      monster.execute_next_turn
    end
  end
end