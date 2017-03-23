# Checkout App

A ruby checkout application using money gem, applies promotions in specific scenarios

### Setup
```
bundle

## Use Checkout and promotions
```
# Create individual products
item_1 = Product.new("001", "Lavender heart", 9_25)
item_2 = Product.new("002", "Personalised cufflinks", 45_00)
item_3 = Product.new("003", "Kids T-shirt", 19_95)

# Create individual promotions
promotion_rules = []
promotion_rules << Promotion.new("001", "morethan", 2, 8_50)
promotion_rules << Promotion.new(nil, "over", 60_00, 10)

# Create checkout
checkout = Checkout.new(promotion_rules)
```

## Run tests
```
rspec
```
