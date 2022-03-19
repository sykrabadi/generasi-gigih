require_relative 'monster'
require_relative "spell"

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
      if index < @cards.size - 1
        result += ', '
      else
        result += "\n"
      end
    end
    result
  end

  def play_turn(own_card, opponent_card, opponent)
    print "#{@name}'s "

    if @cards[own_card-1].respond_to?("attack")
      @cards[own_card-1].attack(opponent.cards[opponent_card-1])
      
    elsif @cards[own_card-1].respond_to?("cast")
      @cards[own_card-1].cast(opponent.cards[opponent_card-1])
      
    end
  end

  def apply_effects
    @cards.each do |card|
      if card.respond_to?("apply_effect")
        card.apply_effect
      end
    end
  end
end
