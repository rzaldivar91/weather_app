class WeatherService
  require "httparty"

  def self.all(lat, lon)
    # https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    base_url = "https://api.openweathermap.org/data/2.5/weather" # ?zip=E14,GB&appid={API key}
    url = "#{base_url}?lat=#{lat}&lon=#{lon}&appid=#{'75ce025965bea81b8af131e0430c9014'}&lang=es"

    HTTParty.get(url)
  end
end
