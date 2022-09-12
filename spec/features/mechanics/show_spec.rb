require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
    @coaster1 = @six_flags.rides.create!(name: 'The Batman Coaster', thrill_rating: 8, open: true)
    @coaster2 = @six_flags.rides.create!(name: 'Superman', thrill_rating: 10, open: false)

    @mechanic1 = Mechanic.create!(name: "Cooter Davenport", years_experience: 25)
    @mechanic2 = Mechanic.create!(name: "Fonzie", years_experience: 18)

    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @hurler.id)
    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @scrambler.id)
    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @ferris.id)
    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @coaster1.id)
    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @coaster2.id)
    RideMechanic.create!(mechanic_id: @mechanic2.id, ride_id: @ferris.id)
  end

  describe 'As a user' do
    describe 'When I visit a mechanic show page' do
      it 'I see their name, years of experience, and the names of the rides theyre working on' do
        visit "/mechanics/#{@mechanic1.id}"

        expect(page).to have_content(@mechanic1.name)
        expect(page).to have_content(@mechanic1.years_experience)
        expect(page).to have_content(@hurler.name)
        expect(page).to have_content(@scrambler.name)
        expect(page).to have_content(@coaster1.name)

        expect(page).to_not have_content(@mechanic2.name)
      end

      it 'I only see rides that are open' do
        visit "/mechanics/#{@mechanic1.id}"
        
        expect(page).to have_content(@hurler.name)
        expect(page).to have_content(@scrambler.name)
        expect(page).to have_content(@coaster1.name)

        expect(page).to_not have_content(@ferris.name)
        expect(page).to_not have_content(@coaster2.name)
      end

      it 'The rides are listed by thrill rating in descending order (most thrills first)' do
        visit "/mechanics/#{@mechanic1.id}"

        expect(@coaster1.name).to appear_before(@hurler.name)
        expect(@hurler.name).to appear_before(@scrambler.name)
      end
    end
  end
end
