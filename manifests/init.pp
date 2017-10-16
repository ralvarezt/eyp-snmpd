# == Class: snmpd
#
# === snmpd documentation
#
class snmpd (
              $manage_package        = true, # @param manage_package Selects if this puppet module manages the package (default: true)
              $package_ensure        = 'installed', # @param package_ensure What state the package should be in (default: installed)
              $manage_service        = true, # @param manage_service controls whether service definition should be managed by Puppet (default: true)
              $manage_docker_service = true, # @param manage_docker_service controls whether service definition should be managed by Puppet in a docker container (default: true)
              $service_ensure        = 'running', # @param service_ensure Whether a service should be running. Valid values are stopped (also called false), running (default: running)
              $service_enable        = true, # @param service_enable Whether a service should be enabled to start at boot
              $community             = 'public', # @param SNMP comunity (default: public)
              $subtree               = [ '.1.3.6.1.2.1.1', '.1.3.6.1.2.1.25.1.1' ], # @param subtree subtrees to publish (default: '.1.3.6.1.2.1.1', '.1.3.6.1.2.1.25.1.1')
              $allowed_hosts         = [ 'default' ], # @param allowed_hosts list of allowed hosts
              $syslocation           = 'somewhere', # @param syslocation System contact information: location (default: somewhere)
              $syscontact            = 'someone', # @param syscontact System contact information: contact (default: someone)
            ) inherits snmpd::params{
  validate_array($subtree)
  validate_array($allowed_hosts)

  class { '::snmpd::install': } ->
  class { '::snmpd::config': } ~>
  class { '::snmpd::service': } ->
  Class['::snmpd']

}
