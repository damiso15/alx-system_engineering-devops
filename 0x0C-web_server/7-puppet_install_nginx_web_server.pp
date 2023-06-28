# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => present,
  content => "
    server {
      listen 80 default_server;
      listen [::]:80 default_server;

      root /var/www/html;
      index index.html;

      location / {
        return 200 'Hello World!';
      }

      location /redirect_me {
        return 301 https://youtu.be/dQw4w9WgXcQ;
      }
    }
  ",
}

# Enable and start Nginx service
service { 'nginx':
  ensure => running,
  enable => true,
}

