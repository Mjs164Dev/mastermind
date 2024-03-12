class Mastermind
  # Initial setup and other methods remain the same...

  def play
    welcome_message
    game_loop
    final_message
  end

  private

  def welcome_message
    puts 'Welcome to Mastermind!'
  end

  def game_loop
    until game_over?
      process_guess(player_guess)
      @attempts += 1
      show_attempts_left
    end
  end

  def final_message
    if code_cracked?
      puts "Congratulations, you've cracked the code!"
    else
      puts "Game over! The secret code was #{@secret_code.join}."
    end
  end

  def game_over?
    code_cracked? || @attempts >= @max_attempts
  end

  def code_cracked?
    @last_guess == @secret_code
  end

  def process_guess(guess)
    @last_guess = guess
    if code_cracked?
      return
    else
      provide_feedback(guess)
    end
  end

  def show_attempts_left
    puts "#{@max_attempts - @attempts} attempts left."
  end

  # Existing methods for providing feedback, getting player guesses, etc., remain unchanged.
end
