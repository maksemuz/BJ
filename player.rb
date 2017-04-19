require_relative 'diamonds'
require_relative 'clubs'
require_relative 'hearts'
require_relative 'spades'

class Player
  attr_accessor :cash, :cards

  def initialize
    @cash = 100
    @cards = []
  end

  def show_cards
    @cards.map {|card| card.picture}.join("")
  end

  def hide_cards
    @cards.map {|card| card.cover}.join("")
  end

  def pay
    @cash -= 10
  end

  def get_points
    @points = 0
    @cards.each do |card|
      @points += card.value
    end
    @cards.each do |card|
      @points -= 10 if card.rank == 'A' && @points > 21
    end
    @points
  end
end
