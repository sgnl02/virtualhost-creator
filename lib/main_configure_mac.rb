if Configuration::CONST_OS == "darwin"
	# Writing new vhosts-configuration
	File.open("#{Configuration::CONST_DIRECTORY_MAMP}#{Configuration::CONST_FILE_VHOSTS}", 'a') { |file|
		file.write(CONST_CONTENT_VHOST)
	}		

	# Adding new site to hosts-file
	File.open("#{Configuration::CONST_PATH_HOST_MAC_PREFIX}#{Configuration::CONST_FILE_HOSTS}", 'a') { |file|
		file.puts "#{Configuration::CONST_CONTENT_HOST_NAME}"
	}

	# Clearing local DNS-cache
	system("dscacheutil -flushcache")
	puts "Clearing local cache..."

	# Clear terminal-screen
	system("clear")

	# End message
	puts "First time: uncomment \"Virtual hosts\" line in #{Configuration::CONST_DIRECTORY_MAMP}/conf/apache/httpd.conf\n\n"
	puts "Copy and paste:\n\n"
	puts "\tsudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist\n\n"
	puts "And use the default ports in MAMP.\n\n"
	puts "Copy and paste:\n\n"
	puts "\tsudo #{Configuration::CONST_DIRECTORY_MAMP}/bin/stopApache.sh"
	puts "\tsudo #{Configuration::CONST_DIRECTORY_MAMP}/bin/startApache.sh"
end
