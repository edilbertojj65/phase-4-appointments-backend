class Appointment < ApplicationRecord
    belongs_to :patients,  class_name: "Patient", optional: true ,dependent: :destroy
    belongs_to :physicians, class_name: "Physician", optional: true
    has_many :reviews ,dependent: :destroy
end
