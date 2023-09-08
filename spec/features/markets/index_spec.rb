require 'rails_helper'

RSpec.describe 'Markets Index Page', type: :feature do
  describe 'When I visit /markets', :vcr do
    before (:each) do
      visit markets_path
    end

    it 'lists all markets with their name, city, and state' do
      expect(page).to have_selector('tr.market-row', count: 846) # Current count based off of Farmers Market API database
      expect(page).to have_selector('td.market-name', count: 846)
      expect(page).to have_selector('td.market-city', count: 846)
      expect(page).to have_selector('td.market-state', count: 846)
    end
    
    it 'lists a link to each markets show page' do
      expect(page).to have_selector('td.market-link', count: 846)    
      expect(page).to have_link('More Info', count: 846) 
    end

    it 'when [More Info] is clicked, it redirects tot he market show page' do
      first('tr#market-id-322458').click_link('More Info') #id for 14&U Farmers' Market
      
      expect(current_path).to eq(market_path(322458))
    end
  end
end