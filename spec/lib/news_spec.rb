require 'spec_helper'

describe News, vcr: true do

  # As a user
  # I want to see the latest news headlines
  # So that I can stay informed with current events.

  describe '#all' do
    it 'returns all the tech news headlines' do
      expect(News.new.all).to be_an Array
      expect(News.new.all.first).to include "Artificial-Intelligence"
      expect(News.new.all.last).to include "Updating Windows 10"
    end
  end

end
