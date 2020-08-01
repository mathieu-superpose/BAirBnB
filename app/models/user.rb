class User < ApplicationRecord
  has_many :accomodations, foreign_key: 'host_id', class_name: "User"
  has_many :reservations, foreign_key: 'guest_id', class_name: "User"
  validates :email,
    presence: {message: "email mandatory"},
    uniqueness: {message: "email already taken"},
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "correct email adress please" }
  validates :phone,
      presence: {message: "phone mandatory"},
      uniqueness: {message: "phone already taken"},
      format: { with: /\A(?:(?:\+|00)33[\s.-]{0,3}(?:\(0\)[\s.-]{0,3})?|0)[1-9](?:(?:[\s.-]?\d{2}){4}|\d{2}(?:[\s.-]?\d{3}){2})\z/, message: "please enter a valid french number" }
end
