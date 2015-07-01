# == Class: elasticsearch_node::installel
#Install elasticsearch
#
# === Authors
#
# Vasiliy V. G.
#
# === Copyright
#
# Copyright 2015 BottleRocket
#

class elasticsearch_node::installel {
  package { 'elasticsearch':
      ensure => 'installed',
  }
}