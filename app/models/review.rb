class Review < ApplicationRecord
  belongs_to :appointments ,  class_name: "Appointment", optional: true
  
end
