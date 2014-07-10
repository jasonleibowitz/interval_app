class AddVenueIdToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :venue_id, :integer
    add_index :visitors, :venue_id
  end
end
