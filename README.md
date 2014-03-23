# Nmap Cookbook

Simple cookbook to install Nmap and friends (nping, ncat, ...) from source.

Follows a generic Chef [install-from-source method](http://stackoverflow.com/a/8642173)

# Requirements

Requires the following packages on Ubuntu:

  * build-essential
  * libpcap-dev
  * liblua5.1-0-dev
  * libpcre3-dev
  * libssl-dev
  * libstdc++6

Note: Only tested under Ubuntu 12.04 LTS 64-bit.

# Usage

To spin up an Ubuntu install using [Vagrant](http://vagrantup.com).

```
git clone https://github.com/werrett/cookbooks/nmap.git
vagrant up
...
vagrant ssh
nmap -v
```

# Attributes

  * version - Version of Nmap to install
  * binary - Install location for the binary.
  * url - URL to pull Nmap source from.
  * configure_options - Arguments passed to `configure`
  * make_options - Arguments passed to `make`
  * install_options - Arguments passed to `make install`

# Author

Jonathan Werrett (<jonathan@werrett.hk>)
