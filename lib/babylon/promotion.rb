class Promotion
  attr_accessor :product_code, :type, :scalar

  def initialize(product_code, type, scalar)
    @product_code = product_code
    @type = type
    @scalar = scalar
  end

  def apply(items, total)

    total
  end
end
