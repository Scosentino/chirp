json.array!(@chirps) do |chirp|
  json.extract! chirp, :id, :from, :description, :url
  json.url chirp_url(chirp, format: :json)
end
