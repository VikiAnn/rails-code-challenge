FactoryBot.define do
  factory :order do
    shipped_at { Time.now }
  end

  factory :widget do
    name { Faker::Commerce.product_name }
    msrp { Faker::Commerce.price * 100}
  end

  factory :line_item do
    order
    widget
    quantity { rand(100) }
    unit_price { rand((widget.msrp - 100)..(widget.msrp + 100)) }
  end
end
