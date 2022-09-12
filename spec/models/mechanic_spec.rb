require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before :each do
    @mechanic1 = Mechanic.new(name: "Cooter Davenport", years_experience: 25)
    @mechanic2 = Mechanic.new(name: "Fonzie", years_experience: 18)
    @mechanic3 = Mechanic.new(name: "Chewbacca", years_experience: 101)
  end
  describe 'relationships' do
    it { should have_many(:rides) }
    it { should have_many(:ride_mechanics) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:years_experience) }
  end

  describe 'class methods' do
    describe '.average_years_experience' do
      expect(Mechanic.average_years_experience).to eq(48)
    end
  end
end
