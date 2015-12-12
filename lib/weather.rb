require 'httparty'

class Weather

  def initialize(lat = nil, long = nil)
    @lat = lat
    @long = long
    @key = ENV['dark_sky_key']
    @current_weather = get
  end

  def url
    "https://api.forecast.io/forecast/#{@key}/#{@lat},#{@long}"
  end

  def current_temp
    @current_weather ? @current_weather['temperature'] : "??"
  end

  private

  def get
    HTTParty.get(url)['currently']
  end

end
