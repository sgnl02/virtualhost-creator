CONST_CONTENT_VHOST = <<-eos
<VirtualHost *:80>
ServerAlias #{CONST_INPUT_SITENAME}#{Configuration::CONST_SITENAME_SUFFIX}
ServerName http://#{CONST_INPUT_SITENAME}#{Configuration::CONST_SITENAME_SUFFIX}
DocumentRoot #{Default::CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}
	<Directory "#{Default::CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}">
		Options All
		AllowOverride All
	</Directory>
</VirtualHost>
eos
