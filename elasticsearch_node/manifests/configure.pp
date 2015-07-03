# == Class: elasticsearch_node::configure
# Create ang Control elasticsearch config on node
#
# === Authors
#
# Vasiliy V. G.
#

class elasticsearch_node::configure (
  $cluster_name = $elasticsearch_node::params::cluster_name,
  $node_name = $elasticsearch_node::params::node_name,
  $index_number_of_shards = $elasticsearch_node::params::index_number_of_shards,
  $index_number_of_replicas = $elasticsearch_node::params::index_number_of_replicas,
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