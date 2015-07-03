# == Class: elasticsearch_node::repos
# install repos for mongodb and elasticsearch
#
# === Authors
#
# Vasiliy V. G.
#

class elasticsearch_node::repos inherits elasticsearch_node::params {
  #create mongodb repo
  file { "/etc/yum.repos.d/mongodb-org-${mongodb_version}.repo":
    ensure  => present,
    content => template('elasticsearch_node/mongodb-org.repo.erb'),
  }

  #create elasticsearch repo
  file { "/etc/yum.repos.d/elasticsearch-${elasticsearch_version}.repo":
    ensure  => present,
    content => template('elasticsearch_node/elasticsearch.repo.erb'),
  }

  #import elasticsearch gpg key
  exec { 'rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch':
    path   => [ '/usr/local/bin/', '/bin/' ],
    unless => '/bin/rpm -qa gpg-pubkey \* --qf "%{version}-%{release} %{summary}\n" | grep -i elasticsearch > /dev/null'
  }
}