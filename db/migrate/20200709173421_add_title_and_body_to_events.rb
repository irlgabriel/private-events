class AddTitleAndBodyToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :title, :string
    add_column :events, :body, :text
  end
end
