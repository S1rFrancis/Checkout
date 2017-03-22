# Money test really, will most likely delete at sone point

I18n.enforce_available_locales = false
describe Money do
  it "should be equal" do
    expected_total_price = Money.new(66_78, "GBP").format
    actual_toal_price = Money.new(66_78, "GBP").format

   expect(expected_total_price).to eql(actual_toal_price)
 end
end
