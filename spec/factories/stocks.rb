# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :stock do
    ticker { Faker::Lorem.characters(4) }
    current_year_sales { Faker::Number.number(10) }
    next_year_sales { Faker::Number.number(10) }
    current_year_ebitda { Faker::Number.number(8) }
    next_year_ebitda { Faker::Number.number(8) }
    current_year_earnings { Faker::Number.number(8) }
    next_year_earnings { Faker::Number.number(8) }
    market_cap { Faker::Number.number(11) }
    cash { Faker::Number.number(10) }
    debt { Faker::Number.number(10) }
    book_value { Faker::Number.number(10) }
    dividend_share { Faker::Number.number(2) }
    earnings_share { Faker::Number.number(2) }
    price { Faker::Number.number(3) }
    price_sales { Faker::Number.number(1) }
    price_book { Faker::Number.number(1) }
  end

  factory :portfolio do
    name { Faker::Name }
  end
end
