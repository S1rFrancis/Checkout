require 'babylon/promotion'
require 'babylon/product'

I18n.enforce_available_locales = false

describe Promotion do
  it "is able to correctly apply more than 2 lavender hearts price set to £8.50" do
    promotion = Promotion.new("001", "morethan",2, 8_50)
    expected_total_price = Money.new(8_50, "GBP").format

    items = []
    items << Product.new("001", "Lavender heart", 9_25)
    items << Product.new("001", "Lavender heart", 9_25)
    items << Product.new("001", "Lavender heart", 9_25)

    total = Money.new(27_75, "GBP")
    expect(promotion.apply(items, total).format).to eq expected_total_price
  end

  it "is able to correctly apply 10% off is you spend more than £60 promotion" do
    promotion = Promotion.new(nil, "over", 60, 10)
    expected_total_price = Money.new(81_00, "GBP").format

    items = []
    items << Product.new("002", "Personalised cufflinks", 45_00)
    items << Product.new("002", "Personalised cufflinks", 45_00)

    total = Money.new(90_00, "GBP")
    expect(promotion.apply(items, total).format).to eq expected_total_price
  end
end
