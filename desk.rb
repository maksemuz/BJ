require_relative 'diamonds'
require_relative 'clubs'
require_relative 'hearts'
require_relative 'spades'

class Desk

  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
  SUITS = [Diamonds, Clubs, Hearts, Spades]

  def initialize
    @desk ||= []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @desk.insert(rand(51), suit.new(rank))
        @desk.delete(nil)
      end
    end
  end

  def get_card
    out = @desk.first
    @desk = @desk.drop(1)
    out
  end

end
