class OrdersController < ApplicationController
  def index
    @shipped_orders = Order.shipped.order(:shipped_at)
    @unshipped_orders = Order.unshipped
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipped_at, line_items_attributes: [:id, :widget_id, :quantity, :_destroy])
  end
end
