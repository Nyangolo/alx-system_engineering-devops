#Install flask version 2.1.0
exec { 'install_flask':
  command  => '/usr/bin/pip3 install flask==2.1.0',
  unless   => '/usr/bin/pip3 show flask | grep -q "Version: 2.1.0"',
  require  => Exec['python-installed'],
  creates  => '/usr/local/lib/python3.*/dist-packages/flask',
}

exec { 'python-installed':
  command => '/usr/bin/which python3',
}
