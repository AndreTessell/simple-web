#
# Cookbook Name:: simple-web
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

httpd_service 'default' do
  action [:create, :start]
end

httpd_config 'simple' do
  source 'simple.erb'
  notifies :restart, 'httpd_service[default]'
end

file '/var/www/index.html' do
  content 'Simple Web Page Delight!\n'
  action :create
end