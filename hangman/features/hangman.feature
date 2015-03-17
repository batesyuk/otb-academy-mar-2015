Feature: Playing hangman

  Rules:
    - Must only take single letter guesses
    - Game must end when lives runs out
    - Game must end when letters are all guessed
    - Letters must reveal when correctly guessed

  Questions
    - Can you end game early?

	Scenario: Single correct guess
  	Given "Hello" is the word to be guessed 
  	When "H" is guessed
  	Then "H" is revealed

	Scenario: Single incorrect guess
  	Given "Hello" is the word to be guessed 
  	When "T" is guessed
  	Then Nothing new is revealed
