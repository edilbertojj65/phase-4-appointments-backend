class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.date :appointments_date
      t.time :appointments_time
      t.string :name_patient
      t.string :last_namePatient
      t.string :name_physician
      t.string :last_namePhysician
      t.string :status
      t.belongs_to :physician
      t.belongs_to :patient
      t.timestamps
    end
  end
end
