class snmpd::config inherits snmpd {

  if($snmpd::manage_package and $snmpd::package_ensure!='absent')
  {
    file { '/etc/snmp/snmpd.conf':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0600',
      content => template("${module_name}/snmpdconf.erb"),
    }

    file { "${::var_net_snmp}/${::service_name}.conf":
      ensure => 'present',
      notify => Service[$::service_name],
      owner  => 'root',
      group  => 'root',
      mode   => '0600',
    }
  }
}
