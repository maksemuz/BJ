require_relative 'diams'
require_relative 'clubs'
require_relative 'hearts'
require_relative 'spades'

class Desk

  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  SUITS = [Diamonds, Clubs, Hearts, Spades]

  def initialize
    @mixed_desk ||= []
    RANKS.each do |rank|
      SUITS.each do |suit|
        @mixed_desk.insert(rand(51), suit.new(rank))
        @mixed_desk.delete(nil)
      end
    end
  end

  def get_desk
    @mixed_desk
  end

end

dsk1 = Desk.new
dsk1.get_desk.each {|card| puts "#{card.rank},\t#{card.suit},\t#{card.code.chr(Encoding::UTF_8)}"}