graylog Cookbook
================
This cookbook installs standalone graylog server with its web user interface. Upstart jobs for both are created. 
This cookbook does minimum installation to build graylog2 system. For next release, all features to edit 
graylog2.conf will be added. Same situation applies for elastic search.


Requirements
------------

- This cookbook is tested on debian7u1 operating system. It is not quaranteed but expected to run on all debian-based system.
- Mongodb instance should run on localhost and it shouldn't require authentication.
- Elasticsearch cluster name should be set, to redirect graylog2-server to specific one. This is important if you are running multiple clusters on same network. 
  Make sure that elasticsearch version matches with the required one for specific graylog2-version. It is indicated on graylog2-installation side.
:
#### packages
- `java`
- `mongod`
- `elasticsearch`

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### os-patch::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['graylog2']['elastic_cluster_name']</tt></td>
    <td>String</td>
    <td>Name of elastichsearch cluster to use</td>
    <td><tt>`hostname`-es</tt></td>
  </tr>
  <tr>
    <td><tt>['graylog2']['root_password']</tt></td>
    <td>String</td>
    <td>Root password for authentication. It is in hash format</td>
    <td><tt>""</tt></td>
  </tr>
  <tr>
    <td><tt>['graylog2']['version']</tt></td>
    <td>String</td>
    <td>Version of graylog2 server</td>
    <td><tt>"0.20.1"</tt></td>
  </tr>
  <tr>
    <td><tt>['graylog2']['webui_version']</tt></td>
    <td>String</td>
    <td>Version of graylog2 web interface</td>
    <td><tt>"0.20.1"</tt></td>
  </tr>
  <tr>
    <td><tt>['graylog2']['install_dir']</tt></td>
    <td>String</td>
    <td>Installation directory for whole graylog2 installation</td>
    <td><tt>"/opt/graylog2"</tt></td>
  </tr>
  <tr>
    <td><tt>['graylog2']['server_pack_name']</tt></td>
    <td>String</td>
    <td>Name of home directory for graylog2 server</td>
    <td><tt>"graylog2-server"</tt></td>
  </tr>
  <tr>
    <td><tt>['graylog2']['webui_pack_name']</tt></td>
    <td>String</td>
    <td>Name of home directory for graylog2 web interface</td>
    <td><tt>"graylog2-web-interface"</tt></td>
  </tr>
  <tr>
    <td><tt>['graylog2']['pass1']</tt></td>
    <td>String</td>
    <td>Password to use graylog2.conf</td>
    <td><tt>"g"</tt></td>
  </tr>
  <tr>
    <td><tt>['graylog2']['pass2']</tt></td>
    <td>String</td>
    <td>Password to use graylog2-web-interface.conf</td>
    <td><tt>"g"</tt></td>
  </tr>
</table>


Usage
-----
#### graylog::default
- Just add `graylog` into run-list of a node. It will do full installation.

#### graylog::server-install
- It will install graylog2-server. It doesn't create an init-job.

#### graylog::server-upstart
- It creates a job to run graylog2-server on start.

#### graylog::webui-install
- It will install graylog2-web-interface. It doesn't create an init-job.

#### graylog::webui-upstart
- It creates a job to run graylog2-web-interface on start.

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: Sefa Sahin Koc
License: Apache
