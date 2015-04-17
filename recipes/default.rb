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

file '/var/www/index2.html' do
  content "<h1>Hello, All My Awesome People!</h1>"
  action :create
end
