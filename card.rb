class Card
  attr_accessor :rank, :code

  def initialize(rank, suit, code)
    @rank = rank
    @suit = suit
    @code = code.chr(Encoding::UTF_8)
  end

  def picture
    "| #{@rank}#{@code} |"
  end

  def cover
    '| ** |'
  end

  def value
    if (2..10).cover? @rank
      @rank
    elsif %w(J Q K).include? @rank
      10
    else
      11
    end
  end
end
