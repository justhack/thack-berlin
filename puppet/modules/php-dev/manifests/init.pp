class php-dev::install {
    package { 'php5-xdebug':
        ensure => installed,
        require => Class['php-cli']
    }
    package { 'phpmyadmin':
        ensure => installed,
        require => Class['php-cli']
    }
    exec { 'download_composer':
      path        => '/bin:/usr/bin',
      command     => 'curl -s http://getcomposer.org/installer | php',
      cwd         => '/vagrant',
      creates     => "/vagrant/composer.phar",
      onlyif => 'test !-f /usr/local/bin/composer',
      require   => Package['curl', 'php5-cli']
    }
    exec { 'mv /vagrant/composer.phar /usr/local/bin/composer':
      path   => '/bin:/usr/bin',
      onlyif => 'test -f /vagrant/composer.phar',
      require   => Exec['download_composer']
    }
    
}

class php-dev {
    include php-dev::install
}
