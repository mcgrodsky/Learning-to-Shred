json.array!(@chords) do |chord|
  json.extract! chord, :id, :title, :user_id
  json.url chord_url(chord, format: :json)
end
