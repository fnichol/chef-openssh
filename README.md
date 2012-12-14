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

MaxStartups specifies the maximum number of concurrent unauthenticated connections to the sshd daemon.
Random early drop can be enabled by specifying three values:

* `node['openssh']['maxstartups']['start']` - if there are currently "start" unauthenticated connections (default 10)
* `node['openssh']['maxstartups']['rate']`  - sshd will refuse connection attempts with a probability of "rate/100" (default 30)
* `node['openssh']['maxstartups']['full']`  - all connection attempts are refused if the number of unauthenticated connections reaches "full" (default 60)
