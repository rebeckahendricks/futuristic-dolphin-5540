class AmusementPark < ApplicationRecord
  validates :name, presence: true
  validates :admission_cost, presence: true
  
  has_many :rides
end
