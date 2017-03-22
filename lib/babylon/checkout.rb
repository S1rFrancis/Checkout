class Checkout
  attr_accessor :promotions, :items

  def initialize(promotion_rules)
    @promotions = promotion_rules
  end

  def scan(item)
    @items << item
  end

  def total
  end
end
