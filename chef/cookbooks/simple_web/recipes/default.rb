#
# Cookbook:: first_cookbook
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file "/info" do
  content "Created by Arild Jensen\n"
end

include_recipe 'apache2'
