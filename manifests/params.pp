class snmpd::params {
  case $::osfamily
  {
    'redhat':
    {
      $package_name = [ 'net-snmp', 'net-snmp-utils' ]
      $var_net_snmp = "/var/lib/${package_name}"
      case $::operatingsystemrelease
      {
        /^[5-7].*$/:
        {
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    
    default: { fail("Unsupported Distro family ! - ${::osfamily}") }
    }
  }
}
