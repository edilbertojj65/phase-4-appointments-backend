class Physician < ApplicationRecord
    has_many :appointments, dependent: :destroy
    has_many :patients, through: :appointments
    has_many :reviews, through: :appointments
end
