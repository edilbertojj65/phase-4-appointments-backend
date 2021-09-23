class CreatePhysicians < ActiveRecord::Migration[6.1]
  def change
    create_table :physicians do |t|
      t.string :user_name
      t.string :last_name
      t.string :title
      t.string :image
      t.string :pone_number

      t.timestamps
    end
  end
end
