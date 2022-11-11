VALID_CHOICES = %w(rock paper scissors lizard spock)
WINNING_MOVES = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['paper', 'spock'],
  'spock' => ['scissors', 'rock']
}

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNING_MOVES[first].include?(second)
end

def display_results(player, computer)
 if win?(player, computer)
  prompt "You won!"
 elsif win?(computer, player)
  prompt "You lost..."
 else
  prompt "Tie game!"
 end
end

user_points_total = 0
computer_points_total = 0

loop do
  choice = ""
  loop do
    prompt "Choose one: #{VALID_CHOICES.join(', ')} "
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "That's not a valid choice."
    end
  end
  computer_choice = ['rock', 'paper', 'scissors', 'lizard', 'spock'].sample()

  prompt "You choice #{choice}; computer chose #{computer_choice}"

  display_results(choice, computer_choice)

  if win?(choice, computer_choice)
    user_points_total += 1
  elsif win?(computer_choice, choice)
    computer_points_total += 1
  end

  if user_points_total == 3
    prompt "You are the grand winner! You got 3 victories."
    break
  elsif computer_points_total == 3
    prompt "You are the grand loser... The computer got 3 victories."
    break
  end
  prompt "Would you like to play again? (Y/N): "
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing. Goodbye!"
