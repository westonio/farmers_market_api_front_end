require 'rails_helper'

RSpec.describe 'Vendor show Page', type: :feature do
  describe 'When I visit /vendors/:id ', :vcr do
    before(:each) do
      # Elevated Elixir data
      vendor_data = {:id=>"55636",
                    :type=>"vendor",
                    :attributes=>
                      {:name=>"Elevated Elixir", 
                        :description=>"Elevated kombucha with premium tea and herbs for a refined taste.", 
                        :contact_name=>"Melida Hane LLD", 
                        :contact_phone=>"928.894.1161", 
                        :credit_accepted=>false}}
      
      @vendor = Vendor.new(vendor_data)

      visit vendor_path(@vendor.id)
    end

    it 'has the vendors name' do
      expect(page).to have_content(@vendor.name)
    end

    it 'has the contact information' do
      expect(page).to have_content('Contact Information')
      expect(page).to have_content("Name: #{@vendor.contact_name}")
      expect(page).to have_content("Phone: #{@vendor.phone}")
    end

    it 'has credit accepted info ' do
      expect(page).to have_content("Credit Accepted? #{@vendor.credit_accepted?}")
    end
  end
end