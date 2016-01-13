json.array!(@chord_diagrams) do |chord_diagram|
  json.extract! chord_diagram, :id, :name, :chords
  json.url chord_diagram_url(chord_diagram, format: :json)
end
