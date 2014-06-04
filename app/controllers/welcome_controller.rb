class WelcomeController < ApplicationController
  def index
    stock = StockQuote::Stock.quote("symbol")
  end
end
