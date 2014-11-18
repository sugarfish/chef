include_recipe 'apt'

=begin
apt_repository 'nginx' do
    uri          'http://ppa.launchpad.net/nginx/stable/ubuntu'
    distribution node['lsb']['codename']
    components   ['main']
    keyserver    "keyserver.ubuntu.com"
    key          'C300EE8C'
    action       :add
end
=end

package "nginx" do
    action :install
end
