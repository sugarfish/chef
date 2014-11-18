name             'hso'
maintainer       'ianatkin, sugarfish'
maintainer_email 'iwatkin@gmail.com'
license          'MIT'
description      'Installs/Configures hso'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{apt nginx php-fpm}.each do |thisdep|
  depends "#{thisdep}"
end

%w{ debian ubuntu }.each do |os|
  supports os
end

