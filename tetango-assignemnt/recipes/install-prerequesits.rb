#
# Cookbook:: tetango-assignemnt
# Recipe:: default
#
# Copyright:: 2018, Erez Tamam, All Rights Reserved.
apt_package 'install-prerequesits' do
  package_name ['apt-transport-https','curl','software-properties-common']
  options ['--no-install-recommends']
end

