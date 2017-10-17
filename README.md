# snmpd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What snmpd affects](#what-snmpd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with snmpd](#beginning-with-snmpd)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

SNMP agent management

## Module Description

This module is intended to disable snmpd

## Setup

### What snmpd affects

* snmpd package
* snmpd service

### Setup Requirements

This module requires pluginsync enabled

### Beginning with snmpd

Install snmpd:

```
class { 'snmpd': }
```

## Usage

disable snmpd:

```
class { 'snmpd':
  service_ensure => 'stopped',
  service_enable => false,
}
```

purge snmpd:

```
class { 'snmpd':
  package_ensure => 'purged',
  manage_service => false,
}
```

## Reference

### snmpd

* basic operations:
  * manage_package        = true,
  * package_ensure        = 'installed',
  * manage_service        = true,
  * manage_docker_service = true,
  * service_ensure        = 'running',
  * service_enable        = true,

## Limitations

Tested on:
* CentOS 5
* CentOS 5
* CentOS 7
* Ubuntu 14.04

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

TODO list

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
