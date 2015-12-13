require 'spec_helper'

describe Events, vcr: true do
  let(:events) { Events.new("Boston") }

  describe '#all' do
    it 'returns a list of todays events in the area' do
      expect(events.all).to be_an Array
      expect(events.all[0]).to include "Stony"
      puts events.all
    end
  end

end
