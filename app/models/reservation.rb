class Reservation < ApplicationRecord
  belongs_to :accomodation
  belongs_to :guest
  validates :start_date,
    presence: {message: "Start date mandatory"}
  validates :duration,
    presence: {message: "duration mandatory"},
    inclusion:  {in: 1..31}
    #rajouter les  [] entre les nombres si l'inclusion ne marche pas
  # validate :can_not_be_admin

  # Check the reservations weres booked or not?
  validate :orverlaping_reservation?
  
  def end_date
    return self.start_date + self.duration
  end

  def orverlaping_reservation?
    self.accomodation.each do |ac|
      if self.start_date < ac.reservation.end_date
        return errors.add(:start_date, "This periode has been booked!")
      end
      if self.end_date < ac.reservation.end_date
        return errors.add(:duration, "This periode has been booked!")
      end
    end
  end

  # def can_not_be_admin
  #   admin_id = self.listing.admin.id
  #   if admin_id == self.guest.id 
  #     return errors.add(:guest, "Admin can not be guest")
  #   end
  # end

end
