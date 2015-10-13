#
# Cookbook Name:: nzbget
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

chef_gem 'httparty' do
  compile_time true
end

gem_package 'httparty'
require 'httparty'

package 'git'
include_recipe 'nzbget::source'
