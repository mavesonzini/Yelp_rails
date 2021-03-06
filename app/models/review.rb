class Review < ApplicationRecord

  belongs_to :user
  belongs_to :restaurant
  validates :rating, inclusion: (1..5)
  validates :user, uniqueness:{ scope: :restaurant, message: "has already reviewed this restaurant" }
end
