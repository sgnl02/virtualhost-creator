module Default
	require './lib/configuration.rb'

	if Configuration::CONST_OS == "darwin"
		CONST_DIRECTORY_ROOT = "#{Configuration::CONST_DIRECTORY_MAMP}/#{Configuration::CONST_DIRECTORY_MAMP_SUFFIX}"
		CONST_GROUP_OWNER = Configuration::CONST_GROUP_OWNER_MAC
	elsif CONST_OS == "linux"
		CONST_DIRECTORY_ROOT = Configuration::CONST_DIRECTORY_LAMP
		CONST_GROUP_OWNER = Configuration::CONST_GROUP_OWNER_LINUX
	end

	load 'lib/file_vhost.rb'
	load 'lib/file_html.rb'
end
