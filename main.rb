require 'fileutils'
require 'etc'
require 'rbconfig'

# This script needs root-access to run.
#
# Required parameter: CONST_INPUT_SITENAME
# Optional parameter: CONST_INPUT_USERNAME
#
# See "lib/main_input.rb"

if ENV['USER'] != 'root'
	puts "\tError: script needs root-access to write in some directories.\n\n"
else
	require './lib/main_input.rb'
	require './lib/helper_default.rb'
	require './lib/main_confirmation.rb'
	require './lib/main_directory_create.rb'
	require './lib/main_directory_rights.rb'
	require './lib/main_configure_mac.rb'
	require './lib/main_configure_linux.rb'
end
