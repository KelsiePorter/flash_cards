require './lib/card'
require './lib/deck'
require './lib/turn'
require './lib/round'
require 'pry'

def start
  card_1 = Card.new(
    "What is the capital of Alaska?",
    "Juneau",
    :Geography
  )
  card_2 = Card.new(
    "The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?",
    "Mars",
    :STEM
  )
  card_3 = Card.new(
    "Describe in words the exact direction that is 697.5° clockwise from due north?",
    "North north west",
    :STEM
  )
  card_4 = Card.new(
    "What is Kelsie's favorite place to eat?",
    "Sherpa Cafe",
    :Pop_culture
  )
  cards = [card_1, card_2, card_3, card_4]
  deck = Deck.new(cards)
  round = Round.new(deck)

  categories = cards.map {|card| card.category}

  unique_categories = categories.uniq

  puts "Welcome! You're playing with #{cards.length} cards."
  puts "-------------------------------------------------"

  until round.cards_already_played.size == round.deck.cards.size
    puts "This is card number #{round.cards_already_played.length + 1} out of #{cards.length}."
    puts "Question: #{round.current_card.question}"

    answer = gets.chomp
    turn = round.take_turn(answer)

    puts turn.feedback
  end

  puts "****** Game over! ******"
  unique_categories.each do |card|
    puts "#{card} - #{round.percent_correct_by_category(card)}% correct"
  end

end

start
