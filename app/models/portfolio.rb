class Portfolio
  include Mongoid::Document
  has_and_belongs_to_many :stocks
  accepts_nested_attributes_for :stocks

  field :name, type: String

end
