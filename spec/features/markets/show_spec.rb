require 'rails_helper'

RSpec.describe 'Market show Page', type: :feature do
  describe 'When I visit /markets/:id ', :vcr do
    before(:each) do
      # Henry County Farmers Market 
      data = {:id=>"325933",
              :type=>"market",
              :attributes=>
              {:name=>"Henry County Farmers Market",
                :street=>"100 block of S Main Street",
                :city=>"New Castle",
                :county=>"Henry",
                :state=>"Indiana",
                :zip=>"47632",
                :lat=>"39.9705",
                :lon=>"-85.355",
                :vendor_count=>13}}
      
      @market = Market.new(data[:attributes])

      visit market_path(@market.id)
    end

    it 'shows the markets name' do
      expect(page).to have_content(@market.name)
    end

    it 'shows the markets address' do
      expect(page).to have_content(@market.address)
    end

    it 'shows '

  end
end
