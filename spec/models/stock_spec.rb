require 'spec_helper'

describe Stock do
  before(:each) do
    Stock.stub(:attributes_from_stock_quote) { {ticker: 'MSFT'} }
  end

  context '#upsert_ticker' do
    it 'should create a stock with attributes passed in' do
      params = {"stock"=> {"ticker"=>"MSFT"}}.with_indifferent_access
      stock = Stock.upsert_ticker(params)

      Stock.count.should == 1
      stock.ticker.should == 'MSFT'
    end

    it 'should update a stock with attributes passed in if stock exists' do      
      create(:stock, ticker: 'MSFT')
      Stock.count.should == 1

      params = {"stock"=> {"ticker"=>"MSFT"}}.with_indifferent_access
      stock = Stock.upsert_ticker(params)

      Stock.count.should == 1
      stock.ticker.should == 'MSFT'      
    end

    it 'should create new portfolios to stocks' do
      params = {"stock"=> {"ticker"=>"MSFT"}, "portfolios"=>"Tech Giants"}.with_indifferent_access
      stock = Stock.upsert_ticker(params)

      Stock.count.should == 1
      stock.ticker.should == 'MSFT'
      
      Portfolio.count.should == 1
      stock.portfolios.should == [Portfolio.first]          
    end

    it 'should assign existing portfolios to stocks' do      
      create(:portfolio, name: 'Tech Giants')
      Portfolio.count.should == 1

      params = {"stock"=> {"ticker"=>"MSFT"}, "portfolios"=>"Tech Giants"}.with_indifferent_access
      stock = Stock.upsert_ticker(params)
      
      Stock.count.should == 1
      stock.ticker.should == 'MSFT'
      
      Portfolio.count.should == 1
      stock.portfolios.should == [Portfolio.first]                
    end
  end
end
