#
# Cookbook:: first_cookbook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file "/info" do
  content "Created by Arild Jensen\n"
end

#link '/etc/apache2/sites-enabled/demo' do
#  to '/etc/apache2/sited-available/demo'
#end

directory '/demo' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template '/demo/index.php' do
  source 'index.php.erb'
  user 'root'
  group 'root'
  mode '0644'
end

template '/demo/healthcheck.php' do
  source 'healthcheck.php.erb'
  user 'root'
  group 'root'
  mode '0644'
end

include_recipe 'apache2'
include_recipe 'apache2::mod_php'

apache_site 'default-ssl' do
  enable false
end

#apache_site 'hireme' do
#  enable true
#  listen "*:80"
#  docroot '/demo'
#end

web_app 'simple_web' do
  template 'demo.conf.erb'
end
