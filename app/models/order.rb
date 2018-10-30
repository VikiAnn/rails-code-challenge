class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order
  accepts_nested_attributes_for :line_items
  has_many :widgets, through: :line_items

  scope :shipped, -> { where.not(shipped_at: nil) }
  scope :unshipped, -> { where(shipped_at: nil) }

  def expedited?
    saved_settings['expedite'] || false
  end

  def returnable?
    saved_settings['returns'] || false
  end

  def settings(opts = {})
    update(saved_settings: opts)
  end

  def shipped?
    shipped_at.present?
  end

  def warehoused?
    saved_settings['warehouse'] || false
  end
end
