name             'graylog2-cookbook'
maintainer       'Sefa Sahin Koc'
maintainer_email 'shnkoc@gmail.com'
license          'Apache 2.0'
description      'Installs/Configures graylog2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


depends 'java', '> 0.0.0'
depends 'mongodb', '> 0.0.0'
depends 'elasticsearch', '> 0.0.0'
