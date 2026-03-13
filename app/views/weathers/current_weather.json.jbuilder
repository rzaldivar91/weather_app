json.array! @weather do |weather|
  json.description weather.weather.description
end
