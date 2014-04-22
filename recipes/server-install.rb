#
# Cookbook Name:: graylog
# Recipe:: server-install
#
# Copyright 2014, Sefa Sahin Koc
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

server_home = "#{node['graylog2']['install_dir']}/#{node['graylog2']['server_pack_name']}"

#create installation dir if missing
directory node['graylog2']['install_dir'] do
    owner "sefa"
    group "sefa"
    mode 00755
    action :create
end

#download graylog server installation package
remote_file "graylog2-server-#{node['graylog2']['version']}.tgz" do
    path "#{node['graylog2']['install_dir']}/graylog2-server-#{node['graylog2']['version']}.tgz"
    source "https://github.com/Graylog2/graylog2-server/releases/download/#{node['graylog2']['version']}/graylog2-server-#{node['graylog2']['version']}.tgz"
    #action :create_if_missing
end


#in file directory, installed file does not present, do installation
bash "graylog2_home" do
    cwd node['graylog2']['install_dir']
    code <<-EOF
        tar -zxvf graylog2-server-#{node['graylog2']['version']}.tgz
        mv graylog2-server-#{node['graylog2']['version']} #{node['graylog2']['server_pack_name']} 
    EOF
    not_if { ::File.directory?(server_home) }
end



#create graylog2.conf in /etc dir
template "/etc/graylog2.conf" do
    source "graylog2.conf.erb"
    mode 00644
end

include_recipe 'graylog2::server-upstart'
