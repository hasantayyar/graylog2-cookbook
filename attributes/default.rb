#
# Cookbook Name:: graylog2
# Attributes:: default
#
# Copyright 2010, edelight GmbH
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

hn = `hostname -s`
default[:graylog2][:elastic_cluster_name] = hn[0...-1]+"-es"


#echo -n yourpassword | shasum -a 256
rp = `echo -n "password" | shasum -a 256`
default[:graylog2][:root_password] = rp[0...-2]

default[:graylog2][:version] = "0.20.1"
default[:graylog2][:webui_version] = "0.20.1"

default[:graylog2][:install_dir] = "/opt/graylog2"


default[:graylog2][:server_pack_name] = "graylog2-server"
default[:graylog2][:webui_pack_name] = "graylog2-web-interface"

default[:graylog2][:web_server_uris] = "http://127.0.0.1:12900"


#pwgen -s 96 1
default[:graylog2][:pass1] = "g"
default[:graylog2][:pass2] = "g" 
