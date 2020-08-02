class Accomodation < ApplicationRecord
  has_many :reservations
  belongs_to :host
  belongs_to :city
  validates :availlable_beds,
    presence: {message: "availlable beds mandatory"},
    inclusion:  {in: 1..50}
  validates :price_per_night,
    presence: {message: "price per night mandatory"},
    inclusion:  {in: 1..50000}
  validates :description,
    presence: {message: "description mandatory"},
    length: { minimum: 140 }
  validates :welcome_text,
    presence: {message: "welcome text mandatory"}
end
