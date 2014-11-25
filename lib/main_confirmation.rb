# Confirmation of settings
puts "Name of the site is going to be \"#{CONST_INPUT_SITENAME}\"..."
puts "Group owner for \"#{CONST_INPUT_SITENAME}\" is going to be \"#{Default::CONST_GROUP_OWNER}\"..."
puts "Name of the address is going to be \"#{CONST_INPUT_SITENAME}#{Configuration::CONST_SITENAME_SUFFIX}\"..."
puts "Going to create a new directory \"#{CONST_INPUT_SITENAME}\" in \"#{Default::CONST_DIRECTORY_ROOT}\"..."
	if Configuration::CONST_OS == "darwin"
		puts "Going to write settings for vhost in \"#{Configuration::CONST_DIRECTORY_MAMP}#{Configuration::CONST_FILE_VHOSTS}\"..."
		puts "Going to write a new rule for vhost in \"#{Configuration::CONST_PATH_HOST_MAC_PREFIX}#{Configuration::CONST_FILE_HOSTS}\"..."
	end

	if Configuration::CONST_OS == "linux"
		puts "Going to write settings for vhost in \"#{Configuration::CONST_DIRECTORY_SITES_AVAILABLE}/#{CONST_INPUT_SITENAME}.conf\"..."
		puts "Going to create a new rule for vhost in \"#{Configuration::CONST_FILE_HOSTS}\"..."
	end

puts "\nAre these settings correct? (Y/n)"
confirmation = gets.chomp()

	if confirmation == "n" || confirmation == "N"
		puts "\tScript aborted...\n\n"
		abort 
	elsif confirmation == "y" || confirmation == "Y" || confirmation.empty?
		puts "\tContinuing...\n\n"
	end
