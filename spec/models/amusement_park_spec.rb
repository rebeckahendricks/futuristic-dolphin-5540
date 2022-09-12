require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:admission_cost) }
  end

  describe 'class methods' do
    before :each do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    end

    describe '.rides_ordered_alphabetically' do
      it 'can order an amusement parks rides alphabetically' do
        expect(AmusementPark.rides_ordered_alphabetically).to eq([@ferris, @hurler, @scrambler])
      end
    end

    describe '.average_thrill_rating' do
      it 'can calculate the average thrill rating of an amusement parks rides' do
        expect(AmusementPark.average_thrill_rating).to eq(6)
      end
    end
  end
end
