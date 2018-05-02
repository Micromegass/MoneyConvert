

require 'money'
require 'money/bank/google_currency'


# set default bank to instance of GoogleCurrency
Money.default_bank = Money::Bank::GoogleCurrency.new
Money.use_i18n = false



puts "Welcome to MoneyConvert. The easy way to convert money"
puts "Please enter the money you would like to convert in the following format: "
puts "100 EUR to USD (Exit by typing 'exit'"

puts
print "> "


str = gets.chomp.strip

while
#200 dollars to EUR
tokens = str.split(' ')
amount = tokens[0].to_f
origin_cur = tokens[1]
target_cur = tokens[3]

#creating an instance 
currency = Money::Currency.wrap(origin_cur)


money = Money.new(amount * currency.subunit_to_unit, origin_cur)
result = money.exchange_to(target_cur)


puts "#{money.format} #{origin_cur} = #{result.format} #{target_cur}"

puts "please go again or exit with command: exit"
puts
print ">"

str = gets.chomp.strip


if str == "exit"
    break
end

end 


