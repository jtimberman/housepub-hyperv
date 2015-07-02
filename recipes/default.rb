#
# Cookbook Name:: housepub-hyperv
# Recipe:: default
#
# Copyright 2015 Joshua Timberman
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
allow_unencrypted_state = File.join(Chef::Config[:file_cache_path], 'allow-unencrypted-set')
trusted_hosts_state = File.join(Chef::Config[:file_cache_path], 'trusted-hosts-set')

windows_feature 'Microsoft-Hyper-V' do
  all true
  action :install
end

# TODO: Use get-item on the wsman locations to check the current state
powershell_script 'allow-unencrypted' do
  code 'set-item wsman:/localhost/client/allowunencrypted -value $true'
  not_if { File.exist?(allow_unencrypted_state) }
  notifies :create, "file[#{allow_unencrypted_state}]", :immediately
end

file allow_unencrypted_state do
  content 'true'
  action :create
end

powershell_script 'trusted-hosts' do
  code 'set-item wsman:/localhost/client/trustedhosts -value * -force'
  not_if { File.exist?(trusted_hosts_state) }
  notifies :create, "file[#{trusted_hosts_state}]", :immediately
end

file trusted_hosts_state do
  content 'true'
  action :create
end
