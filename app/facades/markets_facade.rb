class MarketsFacade
  def markets
    json = MarketsService.new.get_markets
    json[:data].map do |market_data|
      Market.new(market_data)
    end
  end
end