class CreateChords < ActiveRecord::Migration
  def change
    create_table :chords do |t|
      t.string :title
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
