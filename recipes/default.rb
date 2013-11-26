#
# Cookbook Name:: nmap
# Recipe:: default
#
# Copyright (C) 2013 Jonathan Werrett
# 
# All rights reserved - Do Not Redistribute
#

remote_file "/tmp/nmap-#{node[:nmap][:version]}.tar.gz" do
  source "http://nmap.org/dist/nmap-#{node[:nmap][:version]}.tgz"
#  checksum node[:nmap][:checksum] # No checksum avail for nmap
  notifies :run, "bash[install_nmap]", :immediately
end

bash "install_nmap" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -zxf nmap-#{node[:nmap][:version]}.tar.gz
    (cd nmap-#{node[:nmap][:version]}/ && ./configure && make && make install)
  EOH
  action :nothing
end