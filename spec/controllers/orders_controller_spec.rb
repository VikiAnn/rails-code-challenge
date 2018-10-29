require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  describe '#index' do
    subject { get :index }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#show' do
    let(:order) { Order.create! }
    subject { get :show, params: { id: order.id } }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#new' do
    subject { get :new }
    it { is_expected.to have_http_status(:ok) }
  end

  describe '#create' do
    let(:widget) { build_stubbed :widget }
    let(:line_item) { { widget_id: widget.id, quantity: 1, unit_price: widget.price } }
    let(:params) { { order: { line_items: [ line_item ] } } }

    subject { post :create, params: params }

    it { is_expected.to redirect_to(order_path(Order.last.id)) }
  end
end
