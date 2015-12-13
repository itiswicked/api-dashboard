require 'httparty'
require 'pry'

class Events

  def initialize(city)
    @city = city
    @date_begin = Time.now.strftime("%Y-%m-%d")
    @date_end = ( Time.now + (60 * 60 * 24) ).strftime("%Y-%m-%d")
  end

  def url
    "http://api.seatgeek.com/2/events?&venue.city="\
    "#{@city}&datetime_local.gte=#{@date_begin}&datetime_local.lte=#{@date_end}"
  end

  def all
    HTTParty.get(url)['events'].map do |event|
      "#{event['title']} @ #{event['venue']['name']}"
    end
  end
end
