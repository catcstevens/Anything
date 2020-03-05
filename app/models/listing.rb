class Listing < ApplicationRecord
    enum condition: { excellent: 0, good: 1, ok: 2, used: 3 }
  validates :title,:description, :condition, :price, :deposit, :from, :to, :delivery, :rental_period, presence: true
  has_one_attached :picture
  belongs_to :user
  belongs_to :category
    
end
