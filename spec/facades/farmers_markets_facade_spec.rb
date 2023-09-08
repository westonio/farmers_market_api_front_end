require 'rails_helper'

RSpec.describe FarmersMarketsFacade do
  before(:each) do
    @id = 325933 # Henry County Farmers Market
    @facade = FarmersMarketsFacade.new
  end

  describe 'Market Facade Instance Methods', :vcr  do
    it 'exists' do
      expect(@facade).to be_a(FarmersMarketsFacade)
    end

    it 'can get all markets' do
      expect(@facade.markets).to be_an(Array)
      expect(@facade.markets.first).to be_a(Market)
    end

    it 'can get a specific market' do
      expect(@facade.market(@id)).to be_an(Market)
    end

    it 'can get a markets list of vendors' do
      expect(@facade.market_vendors(@id)).to be_an(Array)
      expect(@facade.market_vendors(@id).first).to be_an(Vendor)
    end
  end
end