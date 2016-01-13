class CreateChordDiagrams < ActiveRecord::Migration
  def change
    create_table :chord_diagrams do |t|
      t.string :name
      t.string :chords

      t.timestamps null: false
    end
  end
end
