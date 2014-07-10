class AddJstimeToVisitors < ActiveRecord::Migration
  def change
    add_column :visitors, :js_time, :string
  end
end
