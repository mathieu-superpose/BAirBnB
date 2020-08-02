class Accomodations < ActiveRecord::Migration[5.2]
  def change
    create_table :accomodations do |t|
      t.integer :availlable_beds
      t.integer :price_per_night
      t.text :description
      t.boolean :has_wifi
      t.text :welcome_text
      t.belongs_to :host
      t.belongs_to :city
      t.timestamps
    end
  end
end
