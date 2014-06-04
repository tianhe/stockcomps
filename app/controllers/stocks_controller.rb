class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.where(ticker: params[:id].upcase).first
  end

  def create
    Stock.upsert_ticker(stock_params[:ticker])
  end

  private

    def stock_params
      params.require(:stock).permit(:ticker)
    end
end
