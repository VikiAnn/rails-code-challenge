class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :widget

  validates :order, :widget, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  monetize :unit_price, as: :price

  before_save :set_unit_price

  def set_unit_price
    self.price = widget.price
  end
end
