# Cookbook Name:: graylog
# Recipe:: graylog2-server-upstart
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

#graylog2-server upstart job

execute "upstart-g-server" do
    command "update-rc.d graylog2-server defaults"
    action :nothing
end

#graylog2-service start
service "graylog2-server" do
    action :nothing
end

#create graylog2-server init job
template "/etc/init.d/graylog2-server" do
    source "server-init-script.erb"
    mode 00755
    notifies :run, 'execute[upstart-g-server]', :immediately
    notifies :start, 'service[graylog2-server]', :delayed
    action :create
end

