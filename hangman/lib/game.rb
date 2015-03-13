class Game
	attr_reader :answer, :lives, :correct_guesses, :incorrect_guesses, :game_over

	def initialize(answer, lives = 15)
		@answer = answer
		@lives = lives
		@game_over = false
		@game_complete = false
		@correct_guesses = []
		@incorrect_guesses = []
	end

	def guess(guess)
		if valid_guess(guess)
			handle_valid_guess(guess)
		else
			puts 'Invalid guess try again'
		end
	end

	def valid_guess(guess)
		guess.size == 1
	end

	def game_complete
		@correct_guesses.uniq.size == @answer.downcase.split.join.chars.uniq.size
	end

	def handle_valid_guess(guess)
		if @answer.include?(guess)
			handle_correct_guess(guess)
		else
			handle_incorrect_guess(guess)
		end
	end

	def handle_correct_guess(guess)
		@correct_guesses << guess
		@game_over = game_complete
		return true
	end

	def handle_incorrect_guess(guess)
		@lives -= 1
		@incorrect_guesses << guess
		@game_over = @lives == 0
		return false
	end

	def answer_array
		@answer.split(//).map do |letter|
			if letter_has_been_guessed(letter)
				letter
			else
				"_"
			end
		end
	end

	def letter_has_been_guessed(letter)
		@correct_guesses.any?{ |s| s.casecmp(letter)==0 } || letter == " "
	end

end
