class GeocodingService
  require "httparty"

  def self.all(zip_code)
    # http://api.openweathermap.org/geo/1.0/zip?zip=E14,GB&appid={API key}
    # http://api.openweathermap.org/geo/1.0/zip?zip=97173&appid=75ce025965bea81b8af131e0430c9014
    base_url = "http://api.openweathermap.org/geo/1.0/zip" # ?zip=E14,GB&appid={API key}
    url = "#{base_url}?zip=#{zip_code},MX&appid=#{'75ce025965bea81b8af131e0430c9014'}"

    HTTParty.get(url)
  end
end
