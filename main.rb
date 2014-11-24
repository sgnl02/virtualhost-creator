require 'fileutils'
require 'etc'
require 'rbconfig'

# This script needs root-access to run.
#
# Required parameter: CONST_INPUT_SITENAME
# Optional parameter: userName

if ENV['USER'] != 'root'
	puts "\tError: script needs root-access to write in some directories.\n\n"
else
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

	# Load additional files and set default root-directory for Apache
	load 'settings.rb'

		if CONST_OS == "darwin"
						CONST_DIRECTORY_ROOT = "#{CONST_DIRECTORY_MAMP}/#{CONST_DIRECTORY_MAMP_SUFFIX}"
						CONST_GROUP_OWNER = CONST_GROUP_OWNER_MAC
		elsif CONST_OS == "linux"
						CONST_DIRECTORY_ROOT = "#{CONST_DIRECTORY_LAMP}"
						CONST_GROUP_OWNER = CONST_GROUP_OWNER_LINUX
		end

	load 'file_vhost.rb'
	load 'file_html.rb'

	# Confirmation of settings
	puts "Name of the site is going to be \"#{CONST_INPUT_SITENAME}\"..."
	puts "Group owner for \"#{CONST_INPUT_SITENAME}\" is going to be \"#{CONST_GROUP_OWNER}\"..."
	puts "Name of the address is going to be \"#{CONST_INPUT_SITENAME}#{CONST_SITENAME_SUFFIX}\"..."
	puts "Going to create a new directory \"#{CONST_INPUT_SITENAME}\" in \"#{CONST_DIRECTORY_ROOT}\"..."
		if CONST_OS == "darwin"
			puts "Going to write settings for vhost in \"#{CONST_DIRECTORY_MAMP}#{CONST_FILE_VHOSTS}\"..."
			puts "Going to write a new rule for vhost in \"#{CONST_PATH_HOST_MAC_PREFIX}#{CONST_FILE_HOSTS}\"..."
		end

		if CONST_OS == "linux"
			puts "Going to write settings for vhost in \"#{CONST_DIRECTORY_SITES_AVAILABLE}/#{CONST_INPUT_SITENAME}.conf\"..."
			puts "Going to create a new rule for vhost in \"#{CONST_FILE_HOSTS}\"..."
		end

	puts "\nAre these settings correct? (Y/n)"
	confirmation = gets.chomp()
	
		if confirmation == "n" || confirmation == "N"
			puts "\tScript aborted...\n\n"
			abort 
		elsif confirmation == "y" || confirmation == "Y" || confirmation.empty?
			puts "\tContinuing...\n\n"
		end

	# Creating new directory and index.html in Apache web directory
	Dir.mkdir "#{CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}"

	File.open("#{CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}/index.html", 'w') { |file|
		file.write(CONST_CONTENT_HTML)
	}

	# Setting default permissions for Apache web directory: 
	# http://serverfault.com/a/357109
	FileUtils.chown_R "#{userName}", "#{CONST_GROUP_OWNER}", "#{CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}"
	FileUtils.chmod_R 0755, "#{CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}"
	FileUtils.chmod_R "g+s", "#{CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}"

		if CONST_OS == "darwin"
			# Writing new vhosts-configuration
			File.open("#{CONST_DIRECTORY_MAMP}#{CONST_FILE_VHOSTS}", 'a') { |file|
				file.write(CONST_CONTENT_VHOST)
			}		
		
			# Adding new site to hosts-file
			File.open("#{CONST_PATH_HOST_MAC_PREFIX}#{CONST_FILE_HOSTS}", 'a') { |file|
				file.puts "#{CONST_CONTENT_HOST_NAME}"
			}
		
			# Clearing local DNS-cache
			system("dscacheutil -flushcache")
			puts "Clearing local cache..."

			# Clear terminal-screen
			system("clear")

			# End message
			puts "First time: uncomment \"Virtual hosts\" line in #{CONST_DIRECTORY_MAMP}/conf/apache/httpd.conf\n\n"
			puts "Copy and paste:\n\n"
			puts "\tsudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist\n\n"
			puts "And use the default ports in MAMP.\n\n"
			puts "Copy and paste:\n\n"
			puts "\tsudo #{CONST_DIRECTORY_MAMP}/bin/stopApache.sh"
			puts "\tsudo #{CONST_DIRECTORY_MAMP}/bin/startApache.sh"
		elsif CONST_OS == "linux"
			# Writing new vhosts-configuration
			File.open("#{CONST_DIRECTORY_SITES_AVAILABLE}#{CONST_INPUT_SITENAME}.conf", 'w') { |file| 
				file.write(CONST_CONTENT_VHOST)
			}
		
			# Adding new site to hosts-file
			open("#{CONST_FILE_HOSTS}", 'a') { |file|
				file.puts "#{CONST_CONTENT_HOST_NAME}"
			}

			# Enable new Vhost in Apache
			system("a2ensite #{CONST_INPUT_SITENAME}.conf > /dev/null")

			# Clear terminal-screen
			system("clear")

			# End message
			puts "Copy and paste:\n\n"
			puts "\tsudo service apache2 reload"
		end
end
