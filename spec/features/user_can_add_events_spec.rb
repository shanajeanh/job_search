require 'spec_helper'

feature 'user can add events' do
  context 'as an authenticated user' do
    scenario 'there is a button to add new event' do
      visit root_path
      click_link 'Add an event'

      expect(current_path).to eq(new_event_path)
    end

    scenario 'user can add an event' do
      visit new_event_path
      fill_in 'Name', with: 'Hardison Hackers Co'
      fill_in 'emails', with: 'hardison@leverage.com'
      click_button 'Save'

      expect(page).to have_content 'Event added successfully'
      expect(page).to have_content 'Hardison Hackers Co'
    end

    scenario 'user cannot add an event without a name' do
      visit new_event_path
      click_button 'Save'

      expect(page).to have_content 'You must add an event name'
    end

  end
end
