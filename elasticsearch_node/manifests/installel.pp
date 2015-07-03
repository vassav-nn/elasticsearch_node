# == Class: elasticsearch_node::installel
#Install elasticsearch
#
# === Authors
#
# Vasiliy V. G.
#


class elasticsearch_node::installel {
  package { 'elasticsearch':
      ensure => 'installed',
  }
}