class PatientSerializer < ActiveModel::Serializer
   attributes :user_name , :id, :last_name, :email , :phone_number, :image
   has_many :appointments
  #  has_many :physicians, through: :appointments
end
