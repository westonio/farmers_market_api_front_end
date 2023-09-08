require 'rails_helper'

RSpec.describe MarketsFacade do
  before(:each) do
    @facade = MarketsFacade.new
  end

  describe 'Market Facade Instance Methods', :vcr  do
    it 'exists' do
      expect(@facade).to be_a(MarketsFacade)
    end

    it 'can get all markets' do
      expect(@facade.markets).to be_an(Array)
      expect(@facade.markets.first).to be_a(Market)
    end
  end
end