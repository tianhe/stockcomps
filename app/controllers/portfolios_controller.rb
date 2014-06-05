class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def new
    @portfolio = Portfolio.new    
  end

  def create
    portfolio = Portfolio.create(name: portfolio_params[:name])
    redirect_to '/portfolios'
  end

  def update
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:name, :stocks)
    end
end
