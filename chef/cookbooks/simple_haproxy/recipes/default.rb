#
# Cookbook:: simple_haproxy
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

apt_package 'haproxy'

template '/etc/default/haproxy' do
  source 'haproxy.erb'
  user 'root'
  group 'root'
  mode '0644'
end

template '/etc/haproxy/haproxy.cfg' do
  source 'haproxy.cfg.erb'
  user 'root'
  group 'root'
  mode '0644'
end

service 'haproxy' do
  action :start
end
