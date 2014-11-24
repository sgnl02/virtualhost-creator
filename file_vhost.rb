CONST_CONTENT_VHOST = <<-eos
<VirtualHost *:80>
ServerAlias #{CONST_INPUT_SITENAME}#{CONST_SITENAME_SUFFIX}
ServerName http://#{CONST_INPUT_SITENAME}#{CONST_SITENAME_SUFFIX}
DocumentRoot #{CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}
	<Directory "#{CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}">
		Options All
		AllowOverride All
	</Directory>
</VirtualHost>
eos
