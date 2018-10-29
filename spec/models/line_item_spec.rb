require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { is_expected.to respond_to(:order) }
  it { is_expected.to respond_to(:quantity) }
  it { is_expected.to respond_to(:unit_price) }
  it { is_expected.to respond_to(:widget) }

  it { is_expected.to validate_presence_of(:order) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:widget) }

  it { is_expected.to monetize(:unit_price).as(:price) }

  describe '#unit_price' do
    let(:widget) { build :widget, msrp: 200 }
    let(:line_item) { build :line_item, widget: widget }

    it 'is set based on widget price before save' do
      expect {
        line_item.save
      }.to change { line_item.unit_price }.to 200
    end
  end
end
