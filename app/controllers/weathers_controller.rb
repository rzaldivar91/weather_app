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
    if weather_params["zip_code"].present?
      @geocoding = GeocodingService.all(weather_params[:zip_code])
      if @geocoding.success?
        @weather = WeatherService.all(@geocoding["lat"], @geocoding["lon"])

        if @weather.success?
          render :current_weather
        else
          render json: { error: @weather["message"] }, status: @weather["cod"]
        end
      else
        render json: { error: @geocoding["message"] }, status: @geocoding["cod"]
      end
    end

    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def weather_params
    params.permit(:zip_code)
  end
end
