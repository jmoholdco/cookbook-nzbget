#
# Cookbook Name:: nzbget
# Recipe:: service
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
init_style = node['nzbget']['service']['init_style']

user node['nzbget']['service']['user'] do
  action :create
  gid 'nogroup'
  home "/var/lib/#{node['nzbget']['service']['user']}"
  system true
end

if init_style == 'upstart'
  template '/etc/init/nzbget.conf' do
    source 'nzbget.conf.erb'
    owner 'root'
    group 'root'
    mode 0644
  end

elsif init_style == 'lsb'
  template '/etc/init.d/nzbget' do
    source 'lsb_nzbget.conf.erb'
    owner 'root'
    group 'root'
    mode 0777
    variables(name: 'nzbget',
              daemon_path: '/usr/local/nzbget',
              user: node['nzbget']['service']['user'])
  end
end
