require 'game'

RSpec.describe 'Game' do

	let(:lives) { 15 }
	let(:game) { Game.new("Test space", lives) }

	context'when created' do

		it 'creates and answer' do
			expect(game.answer).to_not be_nil
		end

		it 'creates a blank answer array' do
			expect(game.answer_array).to eq(['_', '_', '_', '_', ' ', '_', '_', '_', '_', '_'])
		end

		it 'has full amount of lives left' do
			expect(game.lives).to eq(15)
		end
	end

	context 'when sent a correct letter guess' do

		it 'checks the letter sent returns true' do
			expect(game.guess('t')).to eq(true)
		end

		it 'keeps the same amount of lives' do
			expect(game.lives).to eq(lives)
		end

		it 'increases the amount of correct guesses' do
			game.guess('t')
			expect(game.correct_guesses).to eq(['t'])
		end

		it 'reveals the letter in the answer array' do
			game.guess('t')
			expect(game.answer_array).to eq(['T', '_', '_', 't', ' ', '_', '_', '_', '_', '_'])
		end

		it 'completed the answer' do
			game.guess('t')
			game.guess('e')
			game.guess('s')
			game.guess('p')
			game.guess('a')
			game.guess('c')

			expect(game.answer_array).to eq(['T', 'e', 's', 't', ' ', 's', 'p', 'a', 'c', 'e'])
			expect(game.game_complete).to eq(true)
		end
	end

	context 'when sent an incorrect letter guess' do

		it 'checks the letter sent returns false' do
			expect(game.guess('q')).to eq(false)
		end

		it 'reduces the amount of lives by 1' do
			game.guess('q')
			expect(game.lives).to eq(14)
		end

		it 'increases the amount of incorrect guesses' do
			game.guess('q')
			expect(game.incorrect_guesses).to eq(['q'])
		end

		it 'sets game over if zero lives remaining' do
			game = Game.new("Test", 2)
			game.guess('q')
			game.guess('r')
			expect(game.game_over).to eq(true)
		end
	end

	context 'when sent an invalid letter guess' do

		it 'does not remove any lives' do
			game.guess('aeiou')
			expect(game.lives).to eq(lives)
		end

		it 'does not add to list of incorrect guesses' do
			game.guess('q')
			game.guess('aeiou')
			expect(game.incorrect_guesses).to eq(['q'])
		end

		it 'does not add to list of correct guesses' do
			game.guess('t')
			game.guess('aeiou')
			expect(game.correct_guesses).to eq(['t'])
		end
	end
end
