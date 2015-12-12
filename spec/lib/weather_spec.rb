require 'spec_helper'

RSpec.describe Weather, vcr: true do

  context 'location is determined' do
    lat = 42.2848
    long = -71.0741
    let(:weather) { Weather.new(lat, long) }

    describe '#url' do
      it 'returns the full url' do
        expect(weather.url)
          .to eq 'https://api.forecast.io/forecast/df1dfcd5377380fa28d44f0ebdbd8f7f/42.2848,-71.0741'
      end
    end

    describe '#current_temp' do
      it 'returns the current temp based on location' do
        expect(weather.current_temp).to eq(56.14)
      end
    end
  end

  context 'location is not determined' do
    let(:weather2) { Weather.new }

    describe '#current_temp' do
      it 'returns a default message' do
        expect(weather2.current_temp).to eq("??")
      end
    end

  end
end
