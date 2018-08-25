#
# Cookbook:: nvmnode
# Recipe:: appserver
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Add user Deploy node.js application
# Install Git

apt_package node['appserver']['reposit'] do
  action :install
end

# Inculde tar cookbook from chef supermarket
#Inculde 

#Download Node.js app

remote_file 'node-v4.2.3' do
  source 'https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz'
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
  not_if {::File.exist?('node-v4.2.3')}
end

#Create new direactory to copy node file

directory 'node' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

execute 'extract' do
  command 'tar xvf node-v4.2.3 --strip-components=1 -C ./node'
  action :run
  not_if {::Dir.exist? ('node/bin')}
end

directory 'node/etc' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
  not_if {::Dir.exist?('node/etc')}
end

# Configure global prefix

execute 'name' do
  command "echo 'prefix=/usr/local' > node/etc/npmrc"
  action :run
  not_if {::File.exist?('node/etc/npmrc')}
end

execute 'node_move' do
  command 'mv node /opt/'
  action :run
 not_if { ::Dir.exist?('opt/node')}
end

execute 'userpermission' do
  command 'chown -R vagrant: /opt/node'
  action :run
end

execute 'Link creation' do
  command 'ln -s /opt/node/bin/node /usr/local/bin/node'
  action :run
#  not_if {::File.exist?{'/usr/local/bin/node'}}
end

execute 'Link creation' do
  command 'ln -s /opt/node/bin/npm /usr/local/bin/npm'
  action :run
#  not_if {::File.exist?{'/usr/local/bin/npm'}}
end

# The below resource corrupts filesexit


=begin
  link '/opt/node/bin/node' do
    to '/usr/local/bin/node'
    link_type :symbolic
  end
=end

