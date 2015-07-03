# elasticsearch_node

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with elasticsearch_node](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Install 'elasticsearch + dependenced' java, mongodb-server. Used 'Hiera' data or defaults.

## Module Description

Minimal module for install any new node in claster of 'elasticsearch 1.6'
'params.pp' Used parameters from 'Hiera' (see example in files) or set defaults

## Setup

###The module manages the following

* Elasticsearch repository files.
* Elasticsearch package.
* Elasticsearch configuration file.
* Elasticsearch service.
* Elasticsearch deps.


## Usage

### Install All

Add in site.pp like this:
$dep_install

```puppet
node 'modtest.node' {
  class { 'elasticsearch_node::install': 
    #Optional
    #$dep_install => true
  }
}
```
! WARNING ! : $dep_install = true may modify installed mongodb and java. Default=false

### Steps from elasticsearch_node::install

#### Create repos

```puppet
node 'modtest.node' {
  class { 'elasticsearch_node::repos': }
}
```

#### Install deps for elasticsearch
Set flag $dep_install = true # Default=false
'! WARNING ! : May modify installed mongodb and java'

```puppet
node 'modtest.node' {
  class { 'elasticsearch_node::depinstall': }
}
```

#### Install elasticsearch only

```puppet
node 'modtest.node' {
  class { 'elasticsearch_node::repos': }
  class { 'elasticsearch_node::installel': }
}
```

#### Create ang Control elasticsearch config on node

```puppet
node 'modtest.node' {
  class { 'elasticsearch_node::configure': }
}
```

### You can late reconfigure node and change service status (stopped in example) in site.pp 
```puppet
node 'modtest.node' {
  class { 'elasticsearch_node::configure':
    cluster_name => 'test1',
    node_name => 'test2',
    index_number_of_shards => 2,
    index_number_of_replicas => 2,
    status => 'stopped'
  }
}
```

### Service only startup control
```puppet
node 'modtest.node' {
  service { 'elasticsearch':
    ensure    => 'running',
    enable    => true,
  }
}
```

## Reference

params.pp use parameters from Hiera (see example in files) or set defaults.

Hiera example for common
```yaml
java_package::packagename: java-1.7.0-openjdk
mongodb::version: 3.0
mongodb::package: 3.0.3
```

Hiera example for node
```yaml
elasticsearch::version: 1.6
elasticsearch::clustername: testcluster
elasticsearch::node_name: testnode
elasticsearch::index_number_of_shards: 2
elasticsearch::index_number_of_replicas: 2
```

For the required elasticsearch config edit params.pp and elasticsearch.yml.erb.
Recommended elasticsearch-HQ plugin for manadge claster. (http://www.elastichq.org/support_plugin.html)

## Limitations

The module has been tested on:
* Puppet 3.8
* CentOS 6.5 x86_64
