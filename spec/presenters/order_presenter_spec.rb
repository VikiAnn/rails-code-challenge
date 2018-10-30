require 'rails_helper'

RSpec.describe OrderPresenter do
  let(:order) { create :order, created_at: Time.new(2017, 12, 31), shipped_at: shipped_at }
  let(:shipped_at) { Time.new(2018, 01, 01) }
  subject { OrderPresenter.present(order) }

  it { is_expected.to delegate_method(:id).to(:order) }
  it { is_expected.to delegate_method(:line_items).to(:order) }

  describe '#shipped_status' do
    context 'unshipped order' do
      let(:shipped_at) { nil }

      it 'returns "Not shipped yet"' do
        expect(subject.shipped_status).to eq "Not shipped yet"
      end
    end

    context 'shipped order' do

      it 'returns message with formatted date' do
        expect(subject.shipped_status).to eq "Shipped January 01, 2018"
      end
    end
  end

  describe '#ordered_at' do
    it 'returns formatted date' do
      expect(subject.ordered_at).to eq "December 31, 2017"
    end
  end
end
