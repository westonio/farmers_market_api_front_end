class MarketsController < ApplicationController
  def index
    @markets = FarmersMarketsFacade.new.markets
  end

  def show
    facade = FarmersMarketsFacade.new
    @market = facade.market(params[:id])
    @vendors = facade.market_vendors(params[:id])
  end
end