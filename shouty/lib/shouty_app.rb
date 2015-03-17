require 'sinatra'
require 'shouty'

class ShoutyApp < Sinatra::Application
	set :people, {}
	set :network, Network.new

	get '/locate' do
		person = Person.new(settings.network)
		name = params[:name]
		lat = params[:lat]
		long = params[:long]
		person.location = Location.new(lat, long)
		settings.people[name] = person
		redirect "/name/#{params[:name]}"
	end

	get '/name/:name' do |name|
		
	end

end