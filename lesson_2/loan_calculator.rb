def prompt(string)
  puts "=> #{string}"
end

def valid?(num)
  num > 0
end

# Print welcome message and grab inputs
prompt "Welcome to the loan calculator!"

# check if loan amount is valid
loop do
  prompt "Enter the loan amount: "
  loan_amount = ""
  loop do
    loan_amount = gets.chomp.to_f
    if valid?(loan_amount)
      break
    else
      prompt "Please enter a loan amount greater than 0"
    end
  end

  prompt "Enter the APR: "
  apr = ""

  loop do
    apr = gets.chomp.to_f
    if valid?(apr) && apr > 1
      break
    else
      prompt "Please format APR as a percentage (i.e. 5.5%)"
    end
  end

  prompt "Enter the loan duration in years: "
  duration = ""
  loop do
    duration = gets.chomp.to_f
    if valid?(duration)
      break
    else
      prompt "Please enter a duration in years greater than 0"
    end
  end
  # convert inputs to make usable in the formula
  monthly_rate = (apr * 0.01) / 12
  duration_months = duration * 12

  # calculate monthly payment
  monthly_payment = loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-duration_months)))

  # print monthly payment for user
  prompt "Your monthly payment is $#{monthly_payment.round(2)}!"
  prompt "Would you like to perform another calculation?"
  answer = gets.chomp
  break unless answer.downcase.start_with('y')
end
prompt "Thank you for using the loan calculator!"
