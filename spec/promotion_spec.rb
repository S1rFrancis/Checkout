require 'babylon/promotion'
require 'babylon/product'

I18n.enforce_available_locales = false

describe Promotion do
  it "is able to correctly apply more than 2 lavender hearts price set to £8.50" do
    promotion = Promotion.new("001", "more_than_2", 8_50)
    expected_total_price = Money.new(8_50, "GBP").format

    items = []
    items << Product.new("001", "Lavender heart", 9_25)
    items << Product.new("001", "Lavender heart", 9_25)
    items << Product.new("001", "Lavender heart", 9_25)

    total = Money.new(22_75, "GBP").format
    expect(promotion.apply(items, total)).to eq expected_total_price
  end
end
