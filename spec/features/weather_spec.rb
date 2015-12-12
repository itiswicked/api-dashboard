require 'spec_helper'

feature 'weather', vcr: true do

  # As a user
  # I want to see the local temperature
  # So that I can dress accordingly.

  scenario 'user sees current current weather' do
    visit ('/')
    click_link 'Weather'

    expect(page).to have_content "Temp"
    expect(page).to have_content "49.62"
  end
end
