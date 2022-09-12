require 'rails_helper'

RSpec.describe 'Amusement Park Show page' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
  end

  describe 'As a visitor' do
    describe 'When I visit an amusement parks show page' do
      it 'I see the name and price of admissions for that amusement park' do
        visit "/amusement_parks/#{@six_flags.id}"

        expect(page).to have_content(@six_flags.name)
        expect(page).to have_content(@six_flags.admission_cost)
        expect(page).to_not have_content(@universal.name)
        expect(page).to_not have_content(@universal.admission_cost)
      end

      it 'I see the names of all the rides that are at that theme park listed in alphabetical order' do
        visit "/amusement_parks/#{@six_flags.id}"

        expect(@ferris.name).to appear_before(@hurler.name)
        expect(@hurler.name).to appear_before(@scrambler.name)
      end

      it 'I see the average thrill rating of this amusement parks rides' do
        visit "/amusement_parks/#{@six_flags.id}"

        expect(page).to have_content("Average Thrill Rating of Rides: 6.0/10")
      end
    end
    end
  end
