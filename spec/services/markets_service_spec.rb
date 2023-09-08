require 'rails_helper'

RSpec.describe MarketsService do
  before(:each) do
    @service = MarketsService.new
  end

  describe 'Market Service Instance Methods', :vcr do
    it 'exists' do
      expect(@service).to be_a(MarketsService)
    end

    it 'can get all the markets' do
      response = @service.get_markets

      expect(response).to be_a(Hash)
      expect(response).to have_key(:data)
      expect(response[:data]).to be_an(Array)

      market = response[:data].first

      expect(market).to be_a(Hash)
      
      expect(market).to have_key(:id)
      expect(market[:id]).to be_a(String)

      expect(market).to have_key(:type)
      expect(market[:type]).to eq("market")

      expect(market).to have_key(:attributes)
      expect(market[:attributes]).to be_a(Hash)

      attributes = market[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)

      expect(attributes).to have_key(:street)
      expect(attributes[:street]).to be_a(String)

      expect(attributes).to have_key(:city)
      expect(attributes[:city]).to be_a(String)

      expect(attributes).to have_key(:state)
      expect(attributes[:state]).to be_a(String)

      expect(attributes).to have_key(:county)
      expect(attributes[:county]).to be_a(String)

      expect(attributes).to have_key(:zip)
      expect(attributes[:zip]).to be_a(String)

      expect(attributes).to have_key(:lat)
      expect(attributes[:lat]).to be_a(String)

      expect(attributes).to have_key(:lon)
      expect(attributes[:lon]).to be_a(String)

      expect(attributes).to have_key(:vendor_count)
      expect(attributes[:vendor_count]).to be_a(Integer)
    end

    it 'can get a specific market' do
      response = @service.get_market(325933) # Henry County Farmers Market

      expect(response).to be_a(Hash)
      expect(response).to have_key(:data)
      expect(response[:data]).to be_a(Hash)

      market = response[:data]

      expect(market).to be_a(Hash)
      
      expect(market).to have_key(:id)
      expect(market[:id]).to be_a(String)

      expect(market).to have_key(:type)
      expect(market[:type]).to eq("market")

      expect(market).to have_key(:attributes)
      expect(market[:attributes]).to be_a(Hash)

      attributes = market[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)

      expect(attributes).to have_key(:street)
      expect(attributes[:street]).to be_a(String)

      expect(attributes).to have_key(:city)
      expect(attributes[:city]).to be_a(String)

      expect(attributes).to have_key(:state)
      expect(attributes[:state]).to be_a(String)

      expect(attributes).to have_key(:county)
      expect(attributes[:county]).to be_a(String)

      expect(attributes).to have_key(:zip)
      expect(attributes[:zip]).to be_a(String)

      expect(attributes).to have_key(:lat)
      expect(attributes[:lat]).to be_a(String)

      expect(attributes).to have_key(:lon)
      expect(attributes[:lon]).to be_a(String)

      expect(attributes).to have_key(:vendor_count)
      expect(attributes[:vendor_count]).to be_a(Integer)
    end

    it 'can get all the markets related vendors' do
      response = @service.get_market_vendors(325933) # Henry County Farmers Market

      expect(response).to be_a(Hash)
      expect(response).to have_key(:data)
      expect(response[:data]).to be_an(Array)

      vendor = response[:data].first

      expect(vendor).to have_key(:id)
      expect(vendor[:id]).to be_a(String)

      expect(vendor).to have_key(:type)
      expect(vendor[:type]).to eq("vendor")

      expect(vendor).to have_key(:attributes)
      expect(vendor[:attributes]).to be_a(Hash)

      attributes = vendor[:attributes]

      expect(attributes).to have_key(:name)
      expect(attributes[:name]).to be_a(String)

      expect(attributes).to have_key(:contact_name)
      expect(attributes[:contact_name]).to be_a(String)

      expect(attributes).to have_key(:contact_phone)
      expect(attributes[:contact_phone]).to be_a(String)

      expect(attributes).to have_key(:description)
      expect(attributes[:description]).to be_a(String)

      expect(attributes).to have_key(:credit_accepted)
      expect(attributes[:credit_accepted]).to be_a(TrueClass).or be_a(FalseClass)
    end
  end
end