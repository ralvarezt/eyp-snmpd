# == Class: snmpd
#
# === snmpd::config documentation
#
class snmpd::config inherits snmpd {

  file { '/etc/snmp/snmpd.conf':
    ensure  => 'present',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template("${module_name}/snmpdconf.erb"),
  }

}
