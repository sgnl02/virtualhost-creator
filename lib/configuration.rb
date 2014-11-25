module Configuration
	# Operating system
	CONST_OS = Gem::Platform.local.os
	
	# Group owners of the Apache web directory
	CONST_GROUP_OWNER_MAC = "_www"
	CONST_GROUP_OWNER_LINUX = "www-data"
	
	# Suffix for hostname
	CONST_SITENAME_SUFFIX = ".local"
	
	# Vhosts-file for MAMP
	CONST_FILE_VHOSTS = "/conf/apache/extra/httpd-vhosts.conf"
	
	# Directory for vhosts files for Linux
	CONST_DIRECTORY_SITES_AVAILABLE = "/etc/apache2/sites-available/"
	
	# Hosts files
	CONST_PATH_HOST_MAC_PREFIX = "/private"
	CONST_FILE_HOSTS = "/etc/hosts"
	
	# Apache web directories
	CONST_DIRECTORY_MAMP = "/Applications/MAMP"
	CONST_DIRECTORY_MAMP_SUFFIX = "htdocs"
	CONST_DIRECTORY_LAMP = "/var/www"

	# IP and hostname for the hosts file
	# 127.0.0.1	YOURNAME.YOURSUFFIX
	CONST_CONTENT_HOST_NAME = "127.0.0.1\t#{CONST_INPUT_SITENAME}#{CONST_SITENAME_SUFFIX}"
end
