require 'rails_helper'

RSpec.describe 'Market show Page', type: :feature do
  describe 'When I visit /markets/:id ', :vcr do
    before(:each) do
      # Henry County Farmers Market 
      market_data = {:id=>"325933",
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

      vendor_data = {:id=>"55636",
                    :type=>"vendor",
                    :attributes=>
                      {:name=>"Elevated Elixir", 
                        :description=>"Elevated kombucha with premium tea and herbs for a refined taste.", 
                        :contact_name=>"Melida Hane LLD", 
                        :contact_phone=>"928.894.1161", 
                        :credit_accepted=>false}}
      
      @market = Market.new(market_data)
      @vendor = Vendor.new(vendor_data)

      visit market_path(@market.id)
    end

    it 'shows the markets name' do
      expect(page).to have_content(@market.name)
    end

    it 'shows the markets address' do
      expect(page).to have_content(@market.address)
    end

    it 'shows a list of the markets vendors (with links to the vendor)' do
      expect(page).to have_content("Vendors at our Market")
      expect(page).to have_css("div.market-vendors", count: 1)
      expect(page).to have_css("p.vendor-link", count: 13)
      expect(page).to have_link(@vendor.name, href: vendor_path(@vendor.id))
    end
  end
end
