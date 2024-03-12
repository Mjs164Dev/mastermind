class Mastermind
  def initialize
    @secret_code = Array.new(4) { rand(1..6) }
    @attempts = 0
    @max_attempts = 10
  end

  def play
    puts "Welcome to Mastermind!"
    until @attempts >= @max_attempts
      guess = player_guess
      if guess == @secret_code
        puts "Congratulations, you've cracked the code!"
        return
      else
        provide_feedback(guess)
      end
      @attempts += 1
      puts "#{@max_attempts - @attempts} attempts left."
    end
    puts "Game over! The secret code was #{@secret_code.join}."
  end

  private

  def player_guess
    puts "Enter your guess (four numbers from 1 to 6, e.g., 1234):"
    gets.chomp.chars.map(&:to_i)
  end

  def provide_feedback(guess)
    correct_position = guess.each_with_index.count { |num, index| num == @secret_code[index] }
    correct_number = guess.count { |num| @secret_code.include?(num) } - correct_position
    puts "#{correct_position} correct number(s) in the correct position."
    puts "#{correct_number} correct number(s) but in the wrong position."
  end
end

game = Mastermind.new
game.play
