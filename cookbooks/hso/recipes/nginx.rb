#
# Cookbook Name:: hso
# Recipe:: nginx
#
# Copyright 2014, ianatkin, sugarfish
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

include_recipe "nginx"

#Setup Nginx
template "#{node['nginx']['dir']}/sites-available/friendgloo.com" do
	source "com.friendgloo.nginx.conf.erb"
	owner "#{ node['nginx']['user'] }"
	group "#{ node['nginx']['group'] }"
	notifies :restart, resources(:service => "nginx")
end

file "#{node['nginx']['dir']}/conf.d/default.conf" do
	action :delete
	notifies :restart, resources(:service => "nginx")
end

file "#{node['nginx']['dir']}/sites-available/default" do
  action :delete
  notifies :restart, resources(:service => "nginx")
end

file "#{node['nginx']['dir']}/sites-enabled/default" do
	action :delete
	notifies :restart, resources(:service => "nginx")
end

link "#{node['nginx']['dir']}/sites-enabled/friendgloo.com" do
	to "#{node['nginx']['dir']}/sites-available/friendgloo.com"
end
