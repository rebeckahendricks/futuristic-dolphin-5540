class RideMechanic < ApplicationRecord
  validates :mechanic_id, presence: true
  validates :ride_id, presence: true

  belongs_to :ride
  belongs_to :mechanic
end
