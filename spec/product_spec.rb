require 'money'
require 'babylon/product'
require 'byebug'

I18n.enforce_available_locales = false

describe Product do
  it "is represented correctly" do
    product = Product.new("001", "Lavender heart", 9_25)
    product_price = Money.new(9_25, "GBP").format
    expect(product.product_code).to eq "001"
    expect(product.name).to eq "Lavender heart"
    expect(product.price).to eq product_price
  end
end
