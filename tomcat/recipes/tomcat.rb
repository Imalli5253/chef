#
# Cookbook:: .
# Recipe:: tomcat
#
# Copyright:: 2018, The Authors, All Rights Reserved.
pack=default['pack_name']
package pack do
  action :install
end
service pack do
  action :restart
end
execute 'tomcat7' do
  # we have to use doiuble quotes for interpolation
  command "apt-get install #{pack}"
  action :run
end
