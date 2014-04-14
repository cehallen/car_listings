class Car < ActiveRecord::Base
  validates :color, presence: true
  validates :year, presence: true, 
    numericality: { greater_than_or_equal_to: 1980, 
      less_than_or_equal_to: Time.now.year }
  validates :mileage, presence: true,
    numericality: { greater_than_or_equal_to: 0 }
  validates :manufacturer, presence: true

  belongs_to :manufacturer, inverse_of: :cars
end
