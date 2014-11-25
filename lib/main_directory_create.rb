# Creating new directory and index.html in Apache web directory
Dir.mkdir "#{Default::CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}"

File.open("#{Default::CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}/index.html", 'w') { |file|
	file.write(CONST_CONTENT_HTML)
}
