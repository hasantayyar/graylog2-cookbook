#
# Cookbook Name:: graylog
# Recipe:: webui-install
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

#download graylog web interface installation package

web_home = node['graylog2']['install_dir']+"/"+node['graylog2']['webui_pack_name']

remote_file "graylog2-web-interface-#{node['graylog2']['webui_version']}.tgz" do
    path "#{node['graylog2']['install_dir']}/graylog2-web-interface-#{node['graylog2']['webui_version']}.tgz"
    source "https://github.com/Graylog2/graylog2-web-interface/releases/download/#{node['graylog2']['webui_version']}/graylog2-web-interface-#{node['graylog2']['webui_version']}.tgz" 
    action :create_if_missing
end

#in installation directory, if installed file does not present, do installation
bash "graylog2_web_home" do
    cwd node['graylog2']['install_dir']
    code <<-EOF
        tar -zxvf graylog2-web-interface-#{node['graylog2']['version']}.tgz
        mv "graylog2-web-interface-#{node['graylog2']['webui_version']}" #{node['graylog2']['webui_pack_name']} 
    EOF
    not_if { ::File.directory?(web_home) }
end


#edit graylog-webui configuration file
template "#{web_home}/conf/graylog2-web-interface.conf" do
    source "graylog2-web-interface.conf.erb"
    mode 00644
end


include_recipe 'graylog2::webui-upstart'
