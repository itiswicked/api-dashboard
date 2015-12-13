require 'spec_helper'

feature 'events', vcr: true do

  # As a user
  # I want to know what events are happening today
  # So that I can plan my evening.

  scenario 'user views a list of today\'s events in their area' do
    visit '/'
    click_link 'Events'
save_and_open_page
    expect(page).to have_content "Stony"
    expect(page).to have_content "Arcs"
    expect(page).to have_content "Shit-faced Shakespeare"
  end

end
