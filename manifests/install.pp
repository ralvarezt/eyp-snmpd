# == Class: snmpd
#
# === snmpd::install documentation
#
class snmpd::install inherits snmpd {

  if($snmpd::manage_package)
  {
    # package here, for example: 
    #package { $snmpd::params::package_name:
    #  ensure => $snmpd::package_ensure,
    #}
  }

}
