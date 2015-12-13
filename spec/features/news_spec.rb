require 'spec_helper'

feature 'news', vcr: true do

  # As a user
  # I want to see the latest news headlines
  # So that I can stay informed with current events.

  scenario 'user views news' do
    visit '/'
    click_link 'News'

    expect(page).to have_content "Artificial-Intelligence"
    expect(page).to have_content "Updating Windows 10"
  end

end
