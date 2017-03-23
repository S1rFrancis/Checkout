class Promotion
  attr_accessor :product_code, :type, :unit, :scalar

  def initialize(product_code, type, unit, scalar)
    @product_code = product_code
    @type = type
    @unit = unit
    @scalar = scalar
  end

  def apply(items, total)
    promotion_scalar = Money.new(scalar, "GBP")

    case type
    when "morethan"
      item_count = 0
      items.each { |item| item_count += 1 if item.product_code == @product_code }

      if item_count >= @unit
        price = items.detect { |item| item.product_code == @product_code }.price
        total_item_cost = price * item_count
        total = total - total_item_cost
        total += (promotion_scalar * item_count)
      end
    when "over"
      threshold = Money.new(@unit, "GBP")
      if total > threshold
        total = total - ((total / Money.new(100, "GBP")) * Money.new(10, "GBP"))
      end
    end
    total
  end
end
