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
            ) inherits snmpd::params{

  class { '::snmpd::install': } ->
  class { '::snmpd::config': } ~>
  class { '::snmpd::service': } ->
  Class['::snmpd']

}
