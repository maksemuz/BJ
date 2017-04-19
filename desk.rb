require_relative 'card'

class Desk
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = { 'Diamonds' => 9830, 'Clubs' => 9827, 'Hearts' => 9829, 'Spades' => 9824 }.freeze

  def initialize
    @desk ||= []
    RANKS.each do |rank|
      SUITS.each do |suit, code|
        @desk.insert(rand(51), Card.new(rank, suit, code))
        @desk.delete(nil)
      end
    end
  end

  def one_card
    out = @desk.first
    @desk = @desk.drop(1)
    out
  end
end
