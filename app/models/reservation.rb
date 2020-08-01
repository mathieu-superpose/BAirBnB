class Reservation < ApplicationRecord
  belongs_to :accomodation
  belongs_to :guest
  validates :start_date,
    presence: {message: "Start date mandatory"}
  validates :duration,
    presence: {message: "duration mandatory"},
    inclusion:  {in: 1..31}
    #rajouter les  [] entre les nombres si l'inclusion ne marche pas
end
