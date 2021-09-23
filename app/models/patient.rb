class Patient < ApplicationRecord
    has_many :appointments , dependent: :destroy 
    # has_many :physicians, through: :appointments , dependent: :destroy
    has_many :reviews, through: :appointments , dependent: :destroy 

    validates :user_name, presence: true
    validates :last_name, presence: true
end
