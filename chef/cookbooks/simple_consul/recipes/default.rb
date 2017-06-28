#
# Cookbook:: simple_consul
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'consul'

external_ip = node[:network][:interfaces][:eth1][:addresses].detect{|k,v| v[:family] == "inet" }.first
node_name = node['hostname']

template '/server.sh' do
  source 'server.sh.erb'
  user 'root'
  group 'root'
  mode '0700'
  variables({
    "external_ip" => external_ip,
    "node_name"   => node_name
  })
end

template '/agent.sh' do
  source 'agent.sh.erb'
  user 'root'
  group 'root'
  mode '0700'
  variables({
    "external_ip" => external_ip,
    "node_name"   => node_name
  })
end

template '/etc/consul/conf.d/web.json' do
  source 'web.json.erb'
  user 'root'
  group 'root'
  mode '0644'
end

#execute 'run-server' do
#  command '/server.sh'
#end
