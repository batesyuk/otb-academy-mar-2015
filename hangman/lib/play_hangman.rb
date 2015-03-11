require 'sinatra'
enable :sessions
require_relative 'game'

get '/' do
	"<form action='./create_game' method='POST'> 	
		Enter Word:<br>
		<input type='text' name='answer'> <br>
		<input type='submit' name='Submit'>
	</form>"
end

post '/create_game' do
	answer = params[:answer]
	session[:game] = Game.new(answer, 15)
	redirect '/guess'
end

get '/guess' do
	"<p> You have started a new game, you have 15 lives left </p>
	<br><br>
	<p> #{game.answer_array}</p>
	<p> #{game.incorrect_guesses}</p>
	<form action='./letter_guessed' method='GET'>
		Enter letter:<br>
		<input type='text' name='letter' maxlength='1'> <br>
		<input type='submit' name='Guess'>
	</form>"
end

get '/letter_guessed' do
	letter = params[:letter]
	if game.guess(letter)
		handle_correct_guess
	else
		handle_incorrect_guess
	end
end

get '/successful_guess' do
	"<p> Greate guess!</p>
	<br><br>
	<p> #{game.answer_array}</p>
	<p> #{game.incorrect_guesses}</p>
	<form action='./letter_guessed' method='GET'>
		Enter letter:<br>
		<input type='text' name='letter' maxlength='1'> <br>
		<input type='submit' name='Guess'>
	</form>"
end

get '/bad_guess' do
	"<p> Unlucky #{game.lives} remaining!</p>
	<br><br>
	<p> #{game.answer_array}</p>
	<p> #{game.incorrect_guesses}</p>
	<form action='./letter_guessed' method='GET'>
		Enter letter:<br>
		<input type='text' name='letter' maxlength='1'> <br>
		<input type='submit' name='Guess'>
	</form>"	
end

get '/game_over' do
	"<p> YOU LOST!!! </p>
	<form action='./' method='GET'>
		Play again?:<br>
		<input type='submit' name='Start'>
	</form>"
end

get '/game_won' do
	"<p> YOU WON!!! </p>
	<form action='./' method='GET'>
		Play again?:<br>
		<input type='submit' name='Start'>
	</form>"
end

def handle_incorrect_guess
	if game.game_over
		redirect '/game_over'
	else
		redirect '/bad_guess'
	end
end

def handle_correct_guess
	if game.game_complete
		redirect '/game_won'
	else
		redirect '/successful_guess'
	end
end

def game
	session[:game]
end