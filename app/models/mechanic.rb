class Mechanic < ApplicationRecord
  validates :name, presence: true
  validates :years_experience, presence: true

  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics
end
