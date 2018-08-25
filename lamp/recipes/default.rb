#
# Cookbook:: lamp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.upda
yum_package 'update' do
  action :update
end


mysql_service 'foo' do
    port '3306'
    version '5.5'
    initial_root_password 'change me'
    action [:create, :start]
  end