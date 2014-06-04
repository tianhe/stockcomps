class PortfoliosController < ApplicationController
  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Porfolio.where(name: portfolio_params[:name]).first
  end

  def create
    Portfolio.create(name: portfolio_params[:name])
  end

  def update
  end

  private

    def portfolio_params
      params.require(:portfolio).permit(:name)
    end
end
