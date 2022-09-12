class Ride < ApplicationRecord
  validates :name, presence: true
  validates :thrill_rating, presence: true

  belongs_to :amusement_park

  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  def self.open_rides
    where(open: true)
  end

  def self.order_by_most_thrills
    order(thrill_rating: :desc)
  end

  def self.order_by_name
    order(:name)
  end

  def self.average_thrill_rating
    average(:thrill_rating)
  end
end
