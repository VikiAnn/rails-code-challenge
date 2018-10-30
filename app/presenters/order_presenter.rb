class OrderPresenter
  extend Forwardable

  def_delegators :order, :id, :line_items

  def self.present(order)
    new(order)
  end

  def initialize(order)
    @order = order
  end

  def ordered_at
    @order.created_at.to_date.to_s(:long)
  end

  def shipped_status
    if @order.shipped_at
      "Shipped " + @order.shipped_at&.to_date&.to_s(:long)
    else
      "Not shipped yet"
    end
  end

  private

  attr_reader :order

end
