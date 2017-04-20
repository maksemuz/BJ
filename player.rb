class Player
  attr_accessor :cash, :cards

  def initialize
    @cash = 100
    @cards = []
  end

  def show_cards
    @cards.map(&:picture).join('')
  end

  def hide_cards
    @cards.map(&:cover).join('')
  end

  def pay
    @cash -= 10
  end

  def any_cash?
    if @cash <= 0
      puts "Ваш счет: #{@cash}. Недостаточно денег для продолжения игры."
      exit
    end
  end

  def not_three_cards?
    @cards.size < 3
  end

  def check_points
    @points = 0
    @cards.each do |card|
      @points += card.value
    end
    @cards.each do |card|
      @points -= 10 if card.rank == 'A' && @points > 21
    end
    @points
  end

  def over?
    check_points > 21
  end
end
