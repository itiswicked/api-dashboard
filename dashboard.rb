require "./lib/geolocation"
require "./lib/weather"
require "sinatra/base"
require 'pry'

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base



  get "/"  do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)
    erb :dashboard
  end


  get '/weather' do
    @location = Geolocation.new(request.ip)
    @weather = Weather.new(@location.latitude, @location.longitude)
    erb :weather
  end


  get '/events' do
    @location = Geolocation.new(request.ip)
    @events = Events.new(@location.city).all
    erb :events
  end

end
