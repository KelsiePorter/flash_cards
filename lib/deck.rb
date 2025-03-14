class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def cards_in_category(category)
    @cards.select {|card| card.category == category}
  end

end
