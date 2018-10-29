require 'rails_helper'

RSpec.describe Order, type: :model do
  it { is_expected.to have_many :line_items }
  it { is_expected.to have_many(:widgets).through :line_items }
  it { is_expected.to accept_nested_attributes_for :line_items }

  describe '.shipped' do
    subject { Order.shipped }

    let!(:shipped_order) { create :order }
    let!(:unshipped_order) { create :order, shipped_at: nil }

    it 'returns only shipped orders' do
      expect(subject).to include shipped_order
      expect(subject).not_to include unshipped_order
    end
  end

  describe '.unshipped' do
    subject { Order.unshipped }

    let!(:shipped_order) { create :order }
    let!(:unshipped_order) { create :order, shipped_at: nil }

    it 'returns only unshipped orders' do
      expect(subject).to include unshipped_order
      expect(subject).not_to include shipped_order
    end
  end

  describe '#shipped?' do
    it { is_expected.to respond_to(:shipped?) }

    context 'when a shipped date exists' do
      before { subject.update(shipped_at: Time.now) }
      it { is_expected.to be_shipped }
    end

    context 'when no shipped date is present' do
      it { is_expected.to_not be_shipped }
    end
  end

  describe '#settings' do
    it { is_expected.to respond_to(:settings) }

    context 'when expedite is present' do
      before { subject.settings(expedite: true) }
      it { is_expected.to be_expedited }
    end

    context 'when returns is present' do
      before { subject.settings(returns: true) }
      it { is_expected.to be_returnable }
    end

    context 'when warehouse is present' do
      before { subject.settings(warehouse: true) }
      it { is_expected.to be_warehoused }
    end
  end
end
