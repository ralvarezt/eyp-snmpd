# == Class: snmpd
#
# === snmpd documentation
#
class snmpd (
              $manage_package        = true,
              $package_ensure        = 'installed',
              $manage_service        = true,
              $manage_docker_service = true,
              $service_ensure        = 'running',
              $service_enable        = true,
              $community             = 'public',
              $subtree               = [ '.1.3.6.1.2.1.1', '.1.3.6.1.2.1.25.1.1' ],
              $allowed_hosts         = undef,
            ) inherits snmpd::params{

  class { '::snmpd::install': } ->
  class { '::snmpd::config': } ~>
  class { '::snmpd::service': } ->
  Class['::snmpd']

}
