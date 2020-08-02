class Reservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.boolean :is_paid
      t.datetime :start_date
      t.integer :duration
      t.belongs_to :guest
      t.belongs_to :accomodation
      t.timestamps
    end
  end
end
