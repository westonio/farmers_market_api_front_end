class MarketsFacade
  def markets
    json = MarketsService.new.get_markets
    json[:data].map do |market_data|
      Market.new(market_data)
    end
  end

  def market(id)
    json = MarketsService.new.get_market(id)
    Market.new(json[:data])
  end
end