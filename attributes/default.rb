#
# Cookbook Name:: nmap
# Attributes:: nmap
#
# Copyright (C) 2014 Jonathan Werrett


default['nmap']['version'] = '6.40'
default['nmap']['binary'] = '/usr/local/bin/nmap'


default['nmap']['url'] = "http://nmap.org/dist/nmap-#{node['nmap']['version']}.tgz"

default['nmap']['configure_options'] = ''
# LUA_LIBS fixes Ncat / Lua make problem
# See <http://ubuntuforums.org/showthread.php?t=2164741>
default['nmap']['make_options']      = '"LUA_LIBS=../liblua/liblua.a -ldl -lm"'
default['nmap']['install_options']   = ''
