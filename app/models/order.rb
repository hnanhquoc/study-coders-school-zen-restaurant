class Order < ApplicationRecord
  belongs_to :food_item
  
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
