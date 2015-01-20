class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.date :date
      t.integer :max_temperature_f
      t.integer :mean_temperature_f
      t.integer :min_temperature_f
      t.integer :precipitation_in
      t.string :events

      t.timestamps null: false
    end
  end
end
