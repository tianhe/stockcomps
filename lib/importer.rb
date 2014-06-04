module Importer
  def attributes_from_stock_quote ticker
    stock = StockQuote::Stock.quote(ticker)

    market_cap = convert_entry_to_number stock.marketcapitalization
    ebitda = convert_entry_to_number stock.ebitda
    shares = market_cap / stock.previousclose

    {
      ticker: stock.symbol,
      current_year_sales: 0,
      next_year_sales: 0,
      current_year_ebitda: ebitda,
      next_year_ebitda: 0,
      current_year_earnings: stock.epsestimatecurrentyear * shares,
      next_year_earnings: stock.epsestimatenextyear * shares,
      market_cap: market_cap,
      cash: 0,
      debt: 0,
      book_value: stock.bookvalue,
      dividend_share: stock.dividendshare,
      price: stock.lasttradepriceonly,
      price_sales: stock.pricesales,
      price_book: stock.pricebook,
      price_earnings_current_year: stock.priceepsestimatecurrentyear,
      price_earnings_next_year: stock.priceepsestimatenextyear,
      dividend_yield: stock.dividendyield,
      short_ratio: stock.shortratio,
      peg: stock.pegratio
    }
  end

end