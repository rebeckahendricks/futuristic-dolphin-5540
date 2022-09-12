require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  before :each do
    @mechanic1 = Mechanic.new(name: "Cooter Davenport", years_experience: 25)
    @mechanic2 = Mechanic.new(name: "Fonzie", years_experience: 18)
    @mechanic3 = Mechanic.new(name: "Chewbacca", years_experience: 101)
  end
  describe 'As a user' do
    describe 'When I visit the mechanics index page' do
      it 'I see a header saying "All Mechanics"' do
        visit '/mechanics'

        expect(page).to have_content("All Mechanics")
      end

      it 'I see a list of all mechanics names and their years of experience' do
        visit '/mechanics'

        expect(page).to have_content(@mechanic1.name)
        expect(page).to have_content(@mechanic2.name)
        expect(page).to have_content(@mechanic3.name)
        expect(page).to have_content(@mechanic1.years_experience)
        expect(page).to have_content(@mechanic2.years_experience)
        expect(page).to have_content(@mechanic3.years_experience)
      end

      it 'I see the average years of experience across all mechanics' do
        visit '/mechanics'

        expect(page).to have_content("Average Years of Experience: 48")
      end
    end
  end
end
