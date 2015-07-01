# == Class: elasticsearch_node::configure
# Create ang Control elasticsearch config on node
#
# === Authors
#
# Vasiliy V. G.
#
# === Copyright
#
# Copyright 2015 BottleRocket
#

class elasticsearch_node::configure (
  $cluster_name = $elasticsearch_node::params::cluster_name,
  $node_name = $elasticsearch_node::params::node_name,
  $status = $elasticsearch_node::params::status
) inherits elasticsearch_node::params {

  file { '/etc/elasticsearch/elasticsearch.yml':
    ensure  => present,
    content => template('elasticsearch_node/elasticsearch.yml.erb'),
  }

  service { 'elasticsearch':
    ensure => $status,
    enable => true,
  }
}