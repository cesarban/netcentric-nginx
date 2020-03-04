

file { '/etc/nginx/nginx.conf':
  ensure  => present,
  owner   => 'nginx',
  group   => 'root',
  mode    => '0744',
  source  => 'puppet:///modules/nginx/files/nginx.conf',
}
