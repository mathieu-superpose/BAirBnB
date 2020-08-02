class Reservation < ApplicationRecord
  belongs_to :accomodation
  belongs_to :guest, class_name: 'User'
  validates :start_date,
    presence: {message: "Start date mandatory"}
  validates :duration,
    presence: {message: "duration mandatory"},
    inclusion:  {in: 1..31}


  validate :guest_can_not_be_admin
  validate :orverlaping_reservation?
  validate :start_date_must_be_start_from_today
  
  def end_date
    return self.start_date + self.duration
  end

  private 
  def orverlaping_reservation?
    self.accomodation.reservations.each do |res|
      if self.start_date < res.end_date
        return errors.add(:start_date, "This periode has been booked!")
      end
      if self.end_date < res.end_date
        return errors.add(:duration, "This periode has been booked!")
      end
    end
  end

  def start_date_must_be_start_from_today
    if self.start_date.to_date < Time.now.to_date 
      return errors.add(:start_date, "Start date must be from today!")
    end
  end

  def guest_can_not_be_admin
    host_id = self.accomodation.host.id
    if host_id == self.guest.id 
      return errors.add(:guest, "Host can not be guest")
    end
  end
end
