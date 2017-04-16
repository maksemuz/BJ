class Card
  attr_accessor :rank, :suit, :code
  CODE = nil

  def initialize(rank, suit = self.class)
    @rank = rank
    @suit = suit
    @code = self.class::CODE.chr(Encoding::UTF_8)
  end

  def carta
    "#{@code}#{@rank}"
  end
end
