class MarketsController < ApplicationController
  def index
    @markets = MarketsFacade.new.markets
  end

  def show
    facade = MarketsFacade.new
    @market = facade.market(params[:id])
    @vendors = facade.market_vendors(params[:id])
  end
end