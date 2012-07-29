#
# Cookbook Name:: openssh
# Recipe:: default
#
# Copyright 2008-2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

packages = case node['platform']
  when 'centos','redhat','fedora','scientific','amazon'
    %w{openssh-clients openssh}
  when 'arch','suse'
    %w{openssh}
  else
    %w{openssh-client openssh-server}
  end
  
packages.each do |pkg|
  package pkg
end

service 'ssh' do
  case node['platform']
  when 'centos','redhat','fedora','arch','scientific','amazon'
    service_name 'sshd'
  else
    service_name 'ssh'
  end
  supports value_for_platform(
    'debian' => { 'default' => [ :restart, :reload, :status ] },
    'ubuntu' => {
      '8.04' => [ :restart, :reload ],
      'default' => [ :restart, :reload, :status ]
    },
    'centos' => { 'default' => [ :restart, :reload, :status ] },
    'redhat' => { 'default' => [ :restart, :reload, :status ] },
    'fedora' => { 'default' => [ :restart, :reload, :status ] },
    'scientific' => { 'default' => [ :restart, :reload, :status ] },
    'arch' => { 'default' => [ :restart ] },
    'suse' => { 'default' => [ :restart, :reload, :status ] },
    'default' => { 'default' => [:restart, :reload ] }
  )
  action [ :enable, :start ]
end

case node['platform']
when 'ubuntu','suse','centos','scientific','amazon','fedora','arch','redhat'
  template '/etc/ssh/sshd_config' do
    source  'sshd_config.erb'
    owner   'root'
    group   'root'
    mode    '0644'

    variables(
      :ports => node['openssh']['port'],
      :listen_addresses => node['openssh']['listen_address'],
      :permit_root_login => node['openssh']['permit_root_login'],
      :password_authentication => node['openssh']['password_authentication'],
      :x11_forwarding => node['openssh']['x11_forwarding'],
      :maxstartups_start => node['openssh']['maxstartups']['start'],
      :maxstartups_rate => node['openssh']['maxstartups']['rate'],
      :maxstartups_full => node['openssh']['maxstartups']['full'],
      :authorized_keys => node['openssh']['authorized_keys']['enabled'],
      :authorized_keys_file => node['openssh']['authorized_keys']['file']
    )

    notifies :restart, 'service[ssh]'
  end
end
