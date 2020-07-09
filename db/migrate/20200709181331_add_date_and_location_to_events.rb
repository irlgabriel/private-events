class AddDateAndLocationToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :date, :datetime
    add_column :events, :location, :string
  end
end
