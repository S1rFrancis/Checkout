require 'babylon/checkout'
require 'babylon/product'

describe Checkout do
  it "has a total price of £66.78" do
    checkout = new Checkout(promotion_rules)
    item_1 = Product.new("001", "Lavender heart", 9_25)
    item_2 = Product.new("002", "Personalised cufflinks", 45_00)
    item_3 = Product.new("003", "Kids T-shirt", 19_95)

    checkout.scan(item_1)
    checkout.scan(item_2)
    checkout.scan(item_3)

    expected_total_price = Money.new(66_78, "GBP").format

    expect(checkout.total).to eq expected_total_price
  end
end
