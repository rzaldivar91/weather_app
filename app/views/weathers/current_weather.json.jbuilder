json.description @weather["weather"][0]["description"].capitalize
json.temp (@weather["main"]["temp"] - 273.15).round(1)
json.feels_like (@weather["main"]["feels_like"] - 273.15).round(1)
json.sunrise Time.at(@weather["sys"]["sunrise"]).in_time_zone("America/Mexico_City").strftime("%I:%M %p")
json.sunset Time.at(@weather["sys"]["sunset"]).in_time_zone("America/Mexico_City").strftime("%I:%M %p")
json.timezone (ActiveSupport::TimeZone[@weather["timezone"] / 3600].name)
