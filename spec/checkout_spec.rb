require 'babylon/checkout'
require 'babylon/product'
require 'babylon/promotion'

I18n.enforce_available_locales = false

describe Checkout do
  it "has a total price of £66.78" do
    promotion_rules = []
    promotion_rules << Promotion.new("001", "morethan", 2, 8_50)
    promotion_rules << Promotion.new(nil, "over", 60_00, 10)
    checkout = Checkout.new(promotion_rules)
    item_1 = Product.new("001", "Lavender heart", 9_25)
    item_2 = Product.new("002", "Personalised cufflinks", 45_00)
    item_3 = Product.new("003", "Kids T-shirt", 19_95)

    checkout.scan(item_1)
    checkout.scan(item_2)
    checkout.scan(item_3)

    expected_total_price = Money.new(66_78, "GBP").format

    expect(checkout.total.format).to eq expected_total_price
  end

  it "has a total price of £36.95" do
    promotion_rules = []
    promotion_rules << Promotion.new("001", "morethan", 2, 8_50)
    promotion_rules << Promotion.new(nil, "over", 60_00, 10)
    checkout = Checkout.new(promotion_rules)
    item_1 = Product.new("001", "Lavender heart", 9_25)
    item_2 = Product.new("003", "Kids T-shirt", 19_95)
    item_3 = Product.new("001", "Lavender heart", 9_25)

    checkout.scan(item_1)
    checkout.scan(item_2)
    checkout.scan(item_3)

    expected_total_price = Money.new(36_95, "GBP").format

    expect(checkout.total.format).to eq expected_total_price
  end

  it "has a total price of £73.75" do
    promotion_rules = []
    promotion_rules << Promotion.new("001", "morethan", 2, 8_50)
    promotion_rules << Promotion.new(nil, "over", 60_00, 10)
    checkout = Checkout.new(promotion_rules)
    item_1 = Product.new("001", "Lavender heart", 9_25)
    item_2 = Product.new("002", "Personalised cufflinks", 45_00)
    item_3 = Product.new("001", "Lavender heart", 9_25)
    item_4 = Product.new("003", "Kids T-shirt", 19_95)

    checkout.scan(item_1)
    checkout.scan(item_2)
    checkout.scan(item_3)
    checkout.scan(item_4)

    expected_total_price = Money.new(73_75, "GBP").format

    expect(checkout.total.format).to eq expected_total_price
  end
end
