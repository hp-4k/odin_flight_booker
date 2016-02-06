class CreatePassengers < ActiveRecord::Migration
  def change
    create_table :passengers do |t|
      t.integer :booking_id
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
