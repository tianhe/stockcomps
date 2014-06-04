class Stock
  include Mongoid::Document
  extend Formatter
  extend Importer
  has_and_belongs_to_many :portfolios, index: true

  field :ticker, type: String
  field :current_year_sales, type: BigDecimal
  field :next_year_sales, type: BigDecimal
  field :current_year_ebitda, type: BigDecimal
  field :next_year_ebitda, type: BigDecimal
  field :current_year_earnings, type: BigDecimal
  field :next_year_earnings, type: BigDecimal
  field :market_cap, type: BigDecimal
  field :cash, type: BigDecimal
  field :debt, type: BigDecimal
  field :book_value, type: BigDecimal
  field :dividend_share, type: BigDecimal
  field :earnings_share, type: BigDecimal
  field :price, type: BigDecimal
  field :price_sales, type: BigDecimal
  field :price_book, type: BigDecimal
  field :price_earnings_current_year, type: BigDecimal
  field :price_earnings_next_year, type: BigDecimal
  field :dividend_yield, type: BigDecimal
  field :short_ratio, type: BigDecimal
  field :peg, type: BigDecimal

  index({ ticker: 1 }, { unique: true })

  def self.upsert_ticker ticker
    attributes = attributes_from_stock_quote(ticker)    
    Stock.where(ticker: attributes[:ticker]).find_and_modify(attributes, upsert: true)
  end
end
