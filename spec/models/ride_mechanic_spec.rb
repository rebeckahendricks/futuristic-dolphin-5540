require 'rails_helper'

RSpec.describe RideMechanic, type: :model do
  describe 'relationships' do
    it { should belong_to(:ride) }
    it { should belong_to(:mechanic) }
  end

  describe 'validations' do
    it { should validate_presence_of(:ride_id) }
    it { should validate_presence_of(:mechanic_id) }
  end
