require 'rails_helper'

RSpec.describe Vendor do
  before(:each) do
    vendor_data_1 = {:id=>"55636",
                  :type=>"vendor",
                  :attributes=>
                    {:name=>"Elevated Elixir", 
                      :description=>"Elevated kombucha with premium tea and herbs for a refined taste.", 
                      :contact_name=>"Melida Hane LLD", 
                      :contact_phone=>"928.894.1161", 
                      :credit_accepted=>false}}
    
    vendor_data_2 = {:id=>"55636",
                  :type=>"vendor",
                  :attributes=>
                    {:name=>"Elevated Elixir", 
                      :description=>"Elevated kombucha with premium tea and herbs for a refined taste.", 
                      :contact_name=>"Melida Hane LLD", 
                      :contact_phone=>"928.894.1161", 
                      :credit_accepted=>true}}
    
    @vendor = Vendor.new(vendor_data_1)
    @vendor2 = Vendor.new(vendor_data_2)
  end

  describe 'initialization' do
    it 'exists' do
      expect(@vendor).to be_a(Vendor)
    end

    it 'has the required attributes' do
      expect(@vendor.id).to eq("55636")
      expect(@vendor.name).to eq("Elevated Elixir")
      expect(@vendor.description).to eq("Elevated kombucha with premium tea and herbs for a refined taste.")
      expect(@vendor.contact_name).to eq("Melida Hane LLD")
      expect(@vendor.contact_phone).to eq("928.894.1161")
      expect(@vendor.credit_accepted).to eq(false)
    end
  end

  describe 'instance methods' do
    it 'converts credit_accepted to YES or NO' do
      expect(@vendor.credit_accepted?).to eq('NO')
      expect(@vendor2.credit_accepted?).to eq('YES')
    end

    it 'converts phone numbers to dash format' do
      expect(@vendor.phone).to eq('928-894-1161')
    end
  end
end