class Card
  attr_accessor :rank, :code
  CODE = nil

  def initialize(rank)
    @rank = rank
    @code = self.class::CODE.chr(Encoding::UTF_8)
  end

  def picture
    "| #{@rank}#{@code} |"
  end

  def cover
    "| ** |"
  end

  def value
    if (2..10).include? @rank
      @rank
    elsif ['J', 'Q', 'K'].include? @rank
      10
    else
      11
    end
  end
end
