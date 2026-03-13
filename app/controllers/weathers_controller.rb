class WeathersController < ApplicationController
  # GET /weathers or /weathers.json
  def index
    @geocoding = GeocodingService.all(weather_params[:zip_code])
    if @geocoding.success?
      render json: @geocoding, status: :ok
    else
      render json: { error: @geocoding["message"] }, status: @geocoding["cod"]
    end
  end

  def current_weather
    @geocoding = GeocodingService.all(weather_params[:zip_code])
    if @geocoding.success?
      @weather = WeatherService.all(@geocoding["lat"], @geocoding["lon"])

      if @weather.success?
        render json: @weather, status: :ok
      else
        render json: { error: @weather["message"] }, status: @weather["cod"]
      end
    else
      render json: { error: @geocoding["message"] }, status: @geocoding["cod"]
    end
  end
  private

  def weather_params
    params.permit(:zip_code)
  end
end
