require 'sinatra'
require_relative '../lib/game'

enable :sessions

get '/' do
	erb :index
end

post '/' do
	answer = params[:new_answer]
	session[:game] = Game.new(answer, 10)
	redirect '/guess'
end

get '/guess' do
	@game = session[:game]
	if @game.game_over
		redirect '/game-over'
	else
		erb :guess
	end
end

post '/guess' do
	game = session[:game]
	guess = params[:guess]
	game.guess(guess)
	redirect '/guess'
end

get '/game-over' do
	game = session[:game]
	session[:game] = nil
	if game.game_complete
		erb :gamewon
	else
		erb :gamelost
	end
end
