#
# Cookbook:: tetango-assignemnt
# Recipe:: default
#
# Copyright:: 2018, Erez Tamam, All Rights Reserved.
apt_package 'install-docker-engine' do
  package_name 'docker-engine'
end

