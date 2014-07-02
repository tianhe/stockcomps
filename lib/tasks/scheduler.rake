task update_stocks: :environment do #2am
  tickers = Stock.all.entries.map(&:ticker)
  tickers.each do |t| 
    Stock.upsert_ticker(ticker: t)
  end
end