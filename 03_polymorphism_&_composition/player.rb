class Player
  attr_reader :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def add_card(card)
    cards << card.dup
  end

  def to_s
    result = "#{@name}:\n"

    @cards.each_with_index do |card, index|
      result += card.to_s
      result += if index < @cards.size - 1
                  ', '
                else
                  "\n"
                end
    end

    result
  end

  def play_turn(own_card, opponent_card, opponent)
    own_card_ = @cards[own_card - 1]
    opponent_card_ = opponent.cards[opponent_card - 1]

    print "#{@name}'s "

    if own_card_.frozen?
      puts "#{own_card_.name} is in frozen state, can't attack"
      return
    end

    own_card_.attack(opponent_card_)
  end

  def apply_effects
    @cards.each(&:apply_effects)
  end
end
