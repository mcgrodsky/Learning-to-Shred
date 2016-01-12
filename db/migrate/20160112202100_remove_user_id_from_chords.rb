class RemoveUserIdFromChords < ActiveRecord::Migration
  def change
    remove_column :chords, :user_id, :integer
  end
end
