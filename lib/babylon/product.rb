class Product
  attr_accessor :product_code, :name, :price

  def initialize(product_code, name, price_val)
    @product_code = product_code
    @name = name
    @price = Money.new(price_val, "GBP")
  end
end
