class Widget < ApplicationRecord
  monetize :msrp, as: :price
end
