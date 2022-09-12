require 'rails_helper'

RSpec.describe 'Add a Ride to a Mechanic' do
  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @coaster1 = @six_flags.rides.create!(name: 'The Batman Coaster', thrill_rating: 8, open: true)

    @mechanic1 = Mechanic.create!(name: "Cooter Davenport", years_experience: 25)

    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @hurler.id)
    RideMechanic.create!(mechanic_id: @mechanic1.id, ride_id: @scrambler.id)
  end

  describe 'As a user' do
    describe 'When I go to a mechanics show page' do
      it 'I see a form to add a ride to their workload' do
        visit "/mechanics/#{@mechanic1.id}"

        expect(page).to have_content(@hurler.name)
        expect(page).to have_content(@scrambler.name)
        expect(page).to_not have_content(@coaster1.name)

        expect(find('form')).to have_content('Ride ID')
      end
    end

    describe 'When I fill in that field with an id of an existing ride and hit submit' do
      it 'I am taken back to that mechanics show page' do
        visit "/mechanics/#{@mechanic1.id}"

        fill_in 'ride_id', with: "#{@coaster1.id}"
        click_button 'Submit'

        expect(current_path).to eq("/mechanics/#{@mechanic1.id}")
      end

      it 'I see the name of that newly added ride on this mechanics show page' do
        visit "/mechanics/#{@mechanic1.id}"

        fill_in 'ride_id', with: "#{@coaster1.id}"
        click_button 'Submit'

        expect(page).to have_content(@hurler.name)
        expect(page).to have_content(@scrambler.name)
        expect(page).to have_content(@coaster1.name)
      end
    end
  end
end
