#
# Cookbook Name:: simple-web
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

httpd_service 'default' do
  action [:create, :start]
  listen_ports ['80','8080']
end

httpd_config 'simple' do
  source 'simple.erb'
  notifies :restart, 'httpd_service[default]'
end

cookbook_file '/tmp/webfiles.tar.gz' do
  source 'webfiles.tar.gz'
  owner 'root'
  group 'root'
  mode '0644'
end

template '/var/www/index.html' do
  source 'index.html.erb'
  action :create
end

execute 'extract web files' do
  command 'tar -xvf /tmp/webfiles.tar.gz -C /var/www/'
  not_if do
    ::File.exists?('/var/www/favicon.ico')
  end
end