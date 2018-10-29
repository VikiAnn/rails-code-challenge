require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { is_expected.to respond_to(:order) }
  it { is_expected.to respond_to(:quantity) }
  it { is_expected.to respond_to(:unit_price) }
  it { is_expected.to respond_to(:widget) }

  it { is_expected.to validate_presence_of(:order) }
  it { is_expected.to validate_presence_of(:quantity) }
  it { is_expected.to validate_presence_of(:unit_price) }
  it { is_expected.to validate_presence_of(:widget) }

  it { is_expected.to monetize(:unit_price).as(:price) }
end
