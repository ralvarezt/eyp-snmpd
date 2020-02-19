class snmpd::params {

  case $::osfamily
  {
    'redhat':
    {
      $package_name = [ 'net-snmp', 'net-snmp-utils' ]

      case $::operatingsystemrelease
      {
        /^[5-7].*$/:
        {
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
  }
}
