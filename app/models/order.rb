class Order < ApplicationRecord
  has_many :line_items, inverse_of: :order
  accepts_nested_attributes_for :line_items
  has_many :widgets, through: :line_items

  scope :shipped, -> { where.not(shipped_at: nil) }
  scope :unshipped, -> { where(shipped_at: nil) }

  def expedited?
    @expedite
  end

  def returnable?
    @returns
  end

  def settings(opts = {})
    @expedite = opts[:expedite].presence
    @returns = opts[:returns].presence
    @warehouse = opts[:warehouse].presence
  end

  def shipped?
    shipped_at.present?
  end

  def warehoused?
    @warehouse
  end
end
