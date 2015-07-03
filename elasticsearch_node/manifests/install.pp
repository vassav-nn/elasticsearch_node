# == Class: elasticsearch_node::install
# Install All
#
# === Authors
# Vasiliy V. G.
#

class elasticsearch_node::install (
  $dep_install = $elasticsearch_node::params::dep_install
) inherits elasticsearch_node::params {

  class { 'elasticsearch_node::repos':
  }

  if ($dep_install == true) {
    class { 'elasticsearch_node::depinstall': }
  }

  class { 'elasticsearch_node::installel':
  } ->

  class { 'elasticsearch_node::configure':
  }
}
