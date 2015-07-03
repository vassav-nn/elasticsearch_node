# == Class: elasticsearch_node::params
#
# === Authors
#
# Vasiliy V. G.
#

class elasticsearch_node::params {
  $elasticsearch_version        = hiera('elasticsearch::version', '1.6')
  $cluster_name                 = hiera('elasticsearch::clustername', 'br')
  $node_name                    = hiera('elasticsearch::node_name', 'modtest')
  $index_number_of_shards       = hiera('elasticsearch::index_number_of_shards', '5')
  $index_number_of_replicas     = hiera('elasticsearch::index_number_of_replicas', '2')
  $status                       = 'running'
  $dep_install                  = false
  $java_package                 = hiera('java_package::packagename', 'java-1.7.0-openjdk')
  $mongodb_version              = hiera('mongodb::version', '3.0')
  $mongodb_package              = hiera('mongodb::package', '3.0.3')
}
