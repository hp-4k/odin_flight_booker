class Flight < ActiveRecord::Base
  belongs_to :from, class_name: 'Airport'
  belongs_to :to, class_name: 'Airport'
  has_many :bookings
  
  default_scope -> { order(:start) }
  
  def from_city
    from.city
  end
  
  def to_city
    to.city
  end
  
end
