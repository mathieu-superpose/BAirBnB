class Reservation < ApplicationRecord
  belongs_to :accomodation
  belongs_to :guest
  validates :start_date,
    presence: {message: "Start date mandatory"}
  validates :duration,
    presence: {message: "duration mandatory"},
    inclusion:  {in: 1..31}


  validate :guest_can_not_be_admin
  validate :orverlaping_reservation?
  
  def end_date
    return self.start_date + self.duration
  end

  private 
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

  def guest_can_not_be_admin
    host_id = self.accomodation.host.id
    if host_id == self.guest.id 
      return errors.add(:guest, "Host can not be guest")
    end
  end
end
