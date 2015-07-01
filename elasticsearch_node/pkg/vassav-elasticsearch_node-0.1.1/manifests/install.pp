# == Class: elasticsearch_node::install
# Install All
#
# === Authors
# Vasiliy V. G.
#
# === Copyright
# Copyright 2015 BottleRocket
#

class elasticsearch_node::install {
  class { 'elasticsearch_node::repos':
  } ->

  class { 'elasticsearch_node::depinstall':
  } ->

  class { 'elasticsearch_node::installel':
  } ->

  class { 'elasticsearch_node::configure':
  } ->
}
