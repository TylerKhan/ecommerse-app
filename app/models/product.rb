class Product < ApplicationRecord
  has_many :carted_products
  belongs_to :category
end
