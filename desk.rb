require_relative 'card'

class Desk
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = { 'Diamonds' => 9830, 'Clubs' => 9827, 'Hearts' => 9829, 'Spades' => 9824 }.freeze

  def initialize
    @desk ||= []
    RANKS.each do |rank|
      SUITS.values.each do |code|
        @desk.insert(rand(51), Card.new(rank, code))
        @desk.delete(nil)
        @desk.shuffle!(random: Random.new(51))
      end
    end
  end

  def one_card
    @desk.pop
  end
end
