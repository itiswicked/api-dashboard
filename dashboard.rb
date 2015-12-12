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
    @ip = request.ip
    @location = Geolocation.new(@ip)
    @weather = Weather.new(@location.latitude, @location.longitude)
    erb :weather
  end

end
