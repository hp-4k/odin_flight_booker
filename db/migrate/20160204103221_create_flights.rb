class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :from_id
      t.integer :to_id
      t.integer :duration
      t.datetime :start

      t.timestamps null: false
    end
  end
end
