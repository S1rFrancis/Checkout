require 'byebug'
class Promotion
  attr_accessor :product_code, :type, :scalar

  def initialize(product_code, type, scalar)
    @product_code = product_code
    @type = type
    @scalar = scalar
  end

  def apply(items, total)
    unit = type.gsub(/[^\d]/, '').to_i
    type.gsub!(/[^a-zA-Z ]/,'')

    case type
    when "morethan"
      item_count = 0
      items.each { |item| item_count += 1 if item.product_code == @product_code}

      if item_count > unit
        price = items.detect { |item| item.product_code == @product_code }.price
        total_item_cost = price * item_count
        total = total - total_item_cost
        promotion_price = Money.new(scalar, "GBP")
        total += promotion_price
      end
    when "over"
    end
    
    total
  end
end
