#
# Cookbook Name:: graylog
# Recipe:: webui-upstart
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

#graylog2-webui upstart job
execute "upstart-g-webui" do
    command "update-rc.d graylog2-webui defaults"
    action :nothing
end

service "graylog2-webui" do
    action :nothing
end

#create graylog2-webui init job
template "/etc/init.d/graylog2-webui" do
    source "webui-init-script.erb"
    mode 00755
    notifies :run, 'execute[upstart-g-webui]', :immediately
    notifies :start, 'service[graylog2-webui]', :delayed
    action :create
end
