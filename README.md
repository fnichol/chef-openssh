Description
===========

Installs and configures sshd.

Attributes
==========

* `node['openssh'][port]` - array of ports that sshd listens on, default [ "22" ]
* `node['openssh']['listen_address']` - array of IPs that sshd listens on, default [ "0.0.0.0" ]
* `node['openssh']['permit_root_login']` - can root ssh in, default "yes"
* `node['openssh']['x11_forwarding]` - allow x11 forwarding, default "no"
* `node['openssh']['password_authentication']` - can users login with passwords instead of keys, default "yes"