#
# Cookbook:: nvmnode
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
# Update Packages

apt_update 'updatepackage' do
    action :update
end
