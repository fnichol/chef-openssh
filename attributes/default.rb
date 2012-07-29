#
# Cookbook Name:: openssh
# Attributes:: default
#
# Copyright 2010, Fletcher Nichol
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

default['openssh']['port']							= [ '22' ]
default['openssh']['listen_address']				= [ '0.0.0.0' ]

default['openssh']['permit_root_login']				= 'yes'
default['openssh']['x11_forwarding']				= 'no'
default['openssh']['password_authentication']		= 'yes'
default['openssh']['maxstartups']['start']			= 10
default['openssh']['maxstartups']['rate']			= 30
default['openssh']['maxstartups']['full']			= 60

default['openssh']['authorized_keys']['enabled']	= false
default['openssh']['authorized_keys']['file']		= '%h/.ssh/authorized_keys'