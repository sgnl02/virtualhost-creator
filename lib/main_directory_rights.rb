# Setting default permissions for Apache web directory: 
# http://serverfault.com/a/357109
FileUtils.chown_R "#{userName}", "#{Default::CONST_GROUP_OWNER}", "#{Default::CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}"
FileUtils.chmod_R 0755, "#{Default::CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}"
FileUtils.chmod_R "g+s", "#{Default::CONST_DIRECTORY_ROOT}/#{CONST_INPUT_SITENAME}"
