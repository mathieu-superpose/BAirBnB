class City < ApplicationRecord
  has_many :accomodations
  validates :zip_code,
      presence: {message: "Zip code mandatory"},
      uniqueness: {message: "Zip code already taken"},
      format: { with: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/, message: "please enter a valid french zip code" }
end
