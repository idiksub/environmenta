class timezone {

exec { 'timedate-Sinagpore':
  command => '/usr/bin/timedatectl set-timezone Asia/Singapore'
}

package { 'ntp':
  require => Exec['timedate-Sinagpore'],
  ensure => installed,
}

service { 'ntpd':
  ensure => running,
  enable => true,
}

}
