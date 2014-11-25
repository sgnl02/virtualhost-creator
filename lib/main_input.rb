# Take input from the user
puts "Name of the website: "
CONST_INPUT_SITENAME = gets.chomp()

	if CONST_INPUT_SITENAME.empty?
		puts "\n\tError: site needs a name.\n\n"
		abort
	end

puts "Owner of the site in the Apache web directory (Default: \"#{Etc.getlogin}\"): "
userName = gets.chomp()

	if userName.empty?
		userName = Etc.getlogin
	end
