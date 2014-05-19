Given(/^an existing user "(.*?)" with password "(.*?)"$/) do |email, password|
  @user = User.create(email: email, password: password)
end

When /^I go to the (.+) page$/ do |page_name|
  visit path_to(page_name)
end

When(/^I fill in "(.*?)" with "(.*?)"$/) do |field, value|
  fill_in field, with: value
end

When(/^I click the "(.*?)" button$/) do |btn_name|
  click_button btn_name
end

Then(/^I should see "(.*?)"$/) do |txt|
  page.body.should have_content(txt)
end
