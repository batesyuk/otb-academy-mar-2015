class Network
  def initialize
    @people = []
  end

  def add_person(person)
    @people << person
  end

  def broadcast(message)
    @people.each do |person|
      person.hear_message(message)
    end
  end
end

class Person
  attr_writer :location
  attr_reader :heard_messages
  attr_accessor :network

  def initialize(network)
    network.add_person self
    @heard_messages = Array.new
    @network = network
  end

  def shout(message)
    network.broadcast message
  end

  def hear_message(message)
    @heard_messages << message
  end

end

Given(/^James is at "(.*?)"$/) do |location|
  @network ||= Network.new
  @james = Person.new(@network)
  @james.location = location
end

Given(/^Chris is at "(.*?)"$/) do |location|
  @network ||= Network.new
  @chris = Person.new(@network)
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
