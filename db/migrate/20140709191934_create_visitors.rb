class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.integer :current_visitors
      t.timestamps
    end
  end
end
