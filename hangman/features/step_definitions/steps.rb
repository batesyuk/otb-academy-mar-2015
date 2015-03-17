Given(/^"(.*?)" is the word to be guessed$/) do |word|
	visit '/'
  fill_in 'new_answer', :with => "#{word}"
  click_button "Lets go!"
end

When(/^"(.*?)" is guessed$/) do |letter|
  fill_in 'guess', :with => "#{letter}"
  click_button "Make Guess"
end

Then(/^"(.*?)" is revealed$/) do |letter|
	expect(page.find('h2.current')).to have_content('H____')
end

Then(/^Nothing new is revealed$/) do
  pending # express the regexp above with the code you wish you had
end