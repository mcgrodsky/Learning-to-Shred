class AddUserIDtoChordsDiagram < ActiveRecord::Migration
  def change
  add_column :chord_diagrams, :user_id, :integer
  end
end
