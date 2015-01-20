class CreateTinyCrimes < ActiveRecord::Migration
  def change
    create_table :tiny_crimes do |t|
      t.integer :crime_id
      t.string :case_number
      t.datetime :date
      t.string :block
      t.integer :iucr
      t.string :primary_type
      t.string :description
      t.string :location_description
      t.string :arrest
      t.string :domestic
      t.integer :beat
      t.integer :district
      t.integer :ward
      t.integer :community_area
      t.integer :fbi_code
      t.integer :x_coordinate
      t.integer :y_coordinate
      t.date :updated_on
      t.string :latitude
      t.string :longitude
      t.string :location

      t.timestamps null: false
    end
  end
end