#!/usr/bin/env bash
#install puppet-lint using Puppet
class { 'python':
  version => 'system',
}

package { 'python3-pip':
  ensure => 'installed',
}

exec { 'install_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  path    => ['/usr/bin'],
  unless  => '/usr/bin/pip3 show Flask | grep -q "Version: 2.1.0"',
  require => [Package['python3-pip'], Class['python']],
  notify  => Exec['activate_virtualenv'],
}

exec { 'activate_virtualenv':
  command     => 'source /path/to/your/virtualenv/bin/activate',
  path        => ['/bin', '/usr/bin'],
  refreshonly => true,
}

exec { 'check_flask_version':
  command => 'flask --version',
  path    => ['/path/to/your/virtualenv/bin', '/usr/bin'],
  require => Exec['activate_virtualenv'],
}
