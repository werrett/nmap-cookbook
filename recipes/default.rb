#
# Cookbook Name:: nmap
# Recipe:: default
#
# Copyright (C) 2014 Jonathan Werrett
#

package 'build-essential'
package 'libpcap-dev'
package 'liblua5.1-0-dev'
package 'libpcre3-dev'
package 'libssl-dev'
package 'libstdc++6'

src_filepath  = "#{Chef::Config['file_cache_path'] || '/tmp'}/nmap-#{node['nmap']['version']}.tgz"

nmap_url = node['nmap']['url'] ||
  "http://nmap.org/dist/nmap-#{node['nmap']['version']}.tgz"

remote_file nmap_url do
  source   nmap_url
  path     src_filepath
  backup   false
  notifies :run, "bash[install_nmap]", :immediately
end

configure_options = node['nmap']['configure_options']
make_options      = node['nmap']['make_options']
install_options   = node['nmap']['install_options']

bash "install_nmap" do
  cwd  ::File.dirname(src_filepath)
  user "root"

  code <<-EOH
    tar -zxf #{::File.basename(src_filepath)} -C #{::File.dirname(src_filepath)}

    (cd nmap-#{node['nmap']['version']}/ && \
    ./configure #{configure_options} && \
    make  #{make_options}            && \
    make install #{install_options})
  EOH
  
  action :nothing
  not_if "#{node['nmap']['binary']} --version | grep -q 'Nmap version #{node['nmap']['version']}'"
end
