class VendorsController < ApplicationController
  def show
    facade = FarmersMarketsFacade.new
    @vendor = facade.vendor(params[:id])
  end
end