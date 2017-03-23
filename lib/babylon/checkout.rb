class Checkout
  attr_accessor :promotions, :items

  def initialize(promotion_rules)
    @promotions = promotion_rules
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    sum = Money.new(0, "GBP")

    items.each { |item| sum += item.price }
    if !promotions.empty?
      promo_sum = Money.new(0_00, "GBP")
      promotions.each do |promotion|
        promo_sum = promotion.apply(@items, sum)
        sum = promo_sum
      end
    end
    sum
  end
end
