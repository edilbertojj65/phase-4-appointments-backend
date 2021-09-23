class Login < ApplicationRecord
   validates :user_name, presence: true
   validates :password , presence: true
end
