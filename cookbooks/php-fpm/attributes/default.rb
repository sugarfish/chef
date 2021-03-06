user = "www-data"
group = "www-data"
listen = "127.0.0.1:9000"
conf_dir = "/etc/php5/fpm/conf.d"
pool_conf_dir = "/etc/php5/fpm/pool.d"
conf_file = "/etc/php5/fpm/php-fpm.conf"
error_log = "/var/log/php5-fpm.log"
pid ="/var/run/php5-fpm.pid"

default['php-fpm']['user'] = user
default['php-fpm']['group'] = group
default['php-fpm']['listen'] = listen
default['php-fpm']['conf_dir'] = conf_dir
default['php-fpm']['pool_conf_dir'] = pool_conf_dir
default['php-fpm']['conf_file'] = conf_file
default['php-fpm']['pid'] = pid
default['php-fpm']['log_dir'] = '/var/log/php-fpm'
default['php-fpm']['error_log'] =  error_log
default['php-fpm']['log_level'] = "notice"
default['php-fpm']['emergency_restart_threshold'] = 0
default['php-fpm']['emergency_restart_interval'] = 0
default['php-fpm']['process_control_timeout'] = 0
default['php-fpm']['pools'] = {
  "www" => {
    :enable => true,
		:process_manager => "dynamic",
		:max_children => 5,
		:min_spare_servers => 1,
		:max_spare_servers => 3
  }
}

default['php-fpm']['skip_repository_install'] = false

#default['php-fpm']['yum_url'] = "http://rpms.famillecollet.com/enterprise/$releasever/remi/$basearch/"
#default['php-fpm']['yum_mirrorlist'] = "http://rpms.famillecollet.com/enterprise/$releasever/remi/mirror"

default['php-fpm']['dotdeb_repository']['uri'] = "http://packages.dotdeb.org"
default['php-fpm']['dotdeb_repository']['key'] = "http://www.dotdeb.org/dotdeb.gpg"
default['php-fpm']['dotdeb-php53_repository']['uri'] = "http://php53.dotdeb.org"

#PHP modules
default["php-fpm"]["install_php_modules"] = true

default["php-fpm"]["php_modules"] = ['php5-common', 'php5-mysql', 'php5-curl', 'php-apc', 'php5-gd']

