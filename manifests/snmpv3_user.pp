define snmpd::snmpv3_user (
    $authpass,
    $authtype   = 'SHA',
    $privpass   = undef,
    $privtype   = 'AES',
) {

  include ::snmpd
  
  $cmd = $privpass ? {
    undef   => "createUser ${title} ${authtype} \"${authpass}\"",
    default => "createUser ${title} ${authtype} \"${authpass}\" ${privtype} \"${privpass}\""
  }
  
  if ($title in $facts['snmpv3_user']) {
    # user details from config are available as fact
    $usm_user = $facts['snmpv3_user'][$title]

    $authhash = snmp::snmpv3_usm_hash($authtype, $usm_user['engine'], $authpass)

    # privacy protocol key may be empty; truncate to 128 bits if used
    $privhash = empty($privpass) ? {
      true    => '',
      default => snmp::snmpv3_usm_hash($authtype, $usm_user['engine'], $privpass, 128)
    }

    # (re)create the user if at least one of the hashes is different
    $create = ($authhash != $usm_user['authhash']) or ($privhash != $usm_user['privhash'])
  }
  else {
    # user is unknown
    $create = true
  }
  if $create {
   file_line { "create-snmpv3-user-${title}":
      path      => "${snmp::var_net_snmp}/${service_name}.conf",
      line      => $cmd,
      match     => "^createUser ${title} ",
      notify    => Service[$service_name],
      require   => File["${snmp::var_net_snmp}/${service_name}.conf"],
      before    => Service[$service_name],
    }
  }
    
}
