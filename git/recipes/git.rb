#
# Cookbook:: .
# Recipe:: git
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_package 'git' do
    action :install
  end