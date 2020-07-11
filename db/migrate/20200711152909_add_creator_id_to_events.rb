class AddCreatorIdToEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :user, foreign_key: 'creator_id'
  end
end
