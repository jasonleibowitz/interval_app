class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :foursquare_id
      t.string :address
      t.string :lat
      t.string :lon
      t.string :city
      t.string :state
      t.timestamps
    end
  end
end
