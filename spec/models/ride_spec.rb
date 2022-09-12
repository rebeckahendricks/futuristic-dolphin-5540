require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many(:mechanics) }
    it { should have_many(:ride_mechanics) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:thrill_rating) }
  end

  describe 'class methods' do
    before :each do
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 6, open: false)
      @coaster1 = @six_flags.rides.create!(name: 'The Batman Coaster', thrill_rating: 8, open: true)
      @coaster2 = @six_flags.rides.create!(name: 'Superman', thrill_rating: 10, open: false)
    end

    describe '.open_rides' do
      it 'can list all rides that are open' do
        expect(Ride.open_rides).to eq([@hurler, @scrambler, @coaster1])
      end
    end

    describe '.order_by_most_thrills' do
      it 'can order all rides from highest thrill rating to lowest' do
        expect(Ride.order_by_most_thrills).to eq([@coaster2, @coaster1, @hurler, @ferris, @scrambler])
      end
    end
  end
end
