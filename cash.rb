module Cashbox

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def bank
      @bank
    end
  end

  module InstanceMethods
    def pay(bid = 10)
      @cash -= bid
      self.class.bank += bid
    end
  end

end
