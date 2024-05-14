require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14) 
    
    expect(card1).to be_an_instance_of(Card)
    expect(card2).to be_an_instance_of(Card)
    expect(card3).to be_an_instance_of(Card)
  end
	
  it "can store cards" do
		card1 = Card.new(:diamond, 'Queen', 12)
		card2 = Card.new(:spade, '3', 3)  
		card3 = Card.new(:heart, 'Ace', 14) 
		
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.cards).to eq([card1, card2, card3])
  end

  it "has high ranking cards" do
  card1 = Card.new(:diamond, 'Queen', 12)
  card2 = Card.new(:spade, '3', 3)  
  card3 = Card.new(:heart, 'Ace', 14) 
  
  cards = [card1, card2, card3]
  deck = Deck.new(cards)
  expect(deck.high_ranking_cards).to eq([card1, card3])
  end

  it "percent high ranking" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)  
    card3 = Card.new(:heart, 'Ace', 14) 
    
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    expect(deck.percent_high_ranking).to eq(66.67)
    end
    
    it "Removes Cards/adds cards" do
      card1 = Card.new(:diamond, 'Queen', 12)
      card2 = Card.new(:spade, '3', 3) 
      card3 = Card.new(:heart, 'Ace', 14) 
      card4 = Card.new(:club, '5', 5)

      cards = [card1, card2, card3]
      deck = Deck.new(cards)
      expect(deck.remove_card).to eq([card2, card3])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(50.0)
      deck.add_card(card4)
        
      expect(deck.cards).to eq([card2, card3, card4])
      expect(deck.high_ranking_cards).to eq([card3])
      expect(deck.percent_high_ranking).to eq(33.33)
    end
end



