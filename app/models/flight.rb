class Flight < ActiveRecord::Base
  belongs_to :from, class_name: 'Airport'
  belongs_to :to, class_name: 'Airport'
  
  default_scope -> { order(:start) }
end
