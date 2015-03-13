require 'sinatra'
require_relative '../lib/game'

get '/' do
	erb :index
end
