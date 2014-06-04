namespace :stocks do
  task :stocks => :environment do
    tickers = Stock.all.entries.map(&:ticker)
    tickers.each do |t| 
      Stock.upsert_ticker(t)
    end
  end
end