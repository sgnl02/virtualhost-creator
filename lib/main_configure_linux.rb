if Configuration::CONST_OS == "linux"
	# Writing new vhosts-configuration
	File.open("#{Configuration::CONST_DIRECTORY_SITES_AVAILABLE}#{CONST_INPUT_SITENAME}.conf", 'w') { |file| 
		file.write(Configuration::CONST_CONTENT_VHOST)
	}

	# Adding new site to hosts-file
	open("#{Configuration::CONST_FILE_HOSTS}", 'a') { |file|
		file.puts "#{Configuration::CONST_CONTENT_HOST_NAME}"
	}

	# Enable new Vhost in Apache
	system("a2ensite #{CONST_INPUT_SITENAME}.conf > /dev/null")

	# Clear terminal-screen
	system("clear")

	# End message
	puts "Copy and paste:\n\n"
	puts "\tsudo service apache2 reload"
end
