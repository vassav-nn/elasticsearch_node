# == Class: elasticsearch_node::depinstall
# Install deps for elasticsearch
# 
# === Authors
#
# Vasiliy V. G.
#
# === Copyright
#
# Copyright 2015 BottleRocket
#

class elasticsearch_node::depinstall  inherits elasticsearch_node::params {

  package { $java_package:
    ensure => 'installed',
  }

  package { "mongodb-org-${mongodb_package}":
    ensure => 'installed',
  } ->

  package { "mongodb-org-server-${mongodb_package}":
    ensure => 'installed',
  } ->

  service { 'mongod':
    ensure => 'running',
    enable => true,
  }

}