class CreatePatients < ActiveRecord::Migration[6.1]
  def change
    create_table :patients do |t|
      t.string :user_name
      t.string :last_name
      t.string :email
      t.string :image
      t.string :phone_number

      t.timestamps
    end
  end
end
