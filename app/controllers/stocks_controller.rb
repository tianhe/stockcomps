class StocksController < ApplicationController
  def index
    @stocks = Stock.all
  end

  def show
    @stock = Stock.where(ticker: params[:id].upcase).first
  end

  def new
    @stock = Stock.new    
  end

  def create
    Stock.upsert_ticker(stock_params)
    redirect_to '/stocks'
  end

  private

    def stock_params
      params.require(:stock).permit(:ticker, :portfolios)
    end
end
