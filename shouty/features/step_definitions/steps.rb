class Person
  attr_writer :location

  def shout(message)
  end

  def heard_messages
    []
  end
end

Given(/^James is at "(.*?)"$/) do |location|
  @james = Person.new
  @james.location = location
end

Given(/^Chris is at "(.*?)"$/) do |location|
  @chris = Person.new
  @chris.location = location
end

When(/^Chris shouts "(.*?)"$/) do |message|
  @brian = message
  @chris.shout(@brian)
end

Then(/^James doesn't hear Chris' shout$/) do
  expect(@james.heard_messages).to be_empty
end

Then(/^James hears Chris' shout$/) do
  expect(@james.heard_messages).to include(@brian)
end
