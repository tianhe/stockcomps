# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stock do
    ticker ""
    current_year_sales ""
    next_year_sales ""
    current_year_ebitda ""
    next_year_ebitda ""
    current_year_earnings ""
    next_year_earnings ""
    market_cap ""
    cash ""
    debt ""
    book_value ""
    dividend_share ""
    earnings_share ""
  end
end
