class nginx_custom_header {
  package { 'nginx':
    ensure => installed,
  }

  file { '/etc/nginx/sites-available/default':
    ensure => file,
    content => "
server {
  listen 80 default_server;
  listen [::]:80 default_server;
  root /var/www/html;
  index index.html index.htm index.nginx-debian.html;
  server_name _;

  location / {
    add_header X-Served-By $hostname;
    try_files \$uri \$uri/ =404;
  }
}
    ",
    notify  => Service['nginx'],
    require => Package['nginx'],
  }

  file { '/etc/nginx/sites-enabled/default':
    ensure => link,
    target => '/etc/nginx/sites-available/default',
    notify => Service['nginx'],
    require => File['/etc/nginx/sites-available/default'],
  }

  service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/nginx/sites-enabled/default'],
  }
}

class { 'nginx_custom_header': }

