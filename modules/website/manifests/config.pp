class website::config {
  File {
    owner   => 'root',
    group   => 'root',
    require => Class['website::install'],
  }
  file { '/etc/ssh/sshd_config' :
    source => 'puppet:///modules/website/ssh/sshd_config',
    notify => Service['ssh'],
  }
  file { '/chroot/keys' :
    ensure  => directory
  }
  file { '/chroot/keys/.ssh' :
    ensure  => directory,
    require => File['/chroot/keys'],
    mode    => '0600',
  }
  file { '/etc/pam.d/sshd' :
    source  => 'puppet:///modules/website/pam.d/sshd',
  }
  file { '/etc/pam.d/login' :
    source  => 'puppet:///modules/website/pam.d/login',
  }
  file { '/etc/init.d/shellinabox' :
    source  => 'puppet:///modules/website/init.d/shellinabox',
  }
  file {'/etc/hostname' :
    content => 'nakeem.com',
    notify  => Exec['hostname'],
  }
  #exec { 'pub_key_cp' :
  #  command => '/bin/cp -frp /chroot/keys/.ssh/id_rsa.pub /chroot/home/guest/.ssh/authorized_keys',
  #  require => Exec['ssh_keygen-root'],
  #}
  #file {'/chroot/home/guest/.ssh/authorized_keys':
  #  ensure => 'link',
  #  target => '/chroot/keys/.ssh/id_rsa.pub',
  #  require => Exec['ssh_keygen-root'],
  #}
  exec { 'hostname' :
    command => '/bin/hostname nakeem.com',
    refreshonly  => 'true', 
  }
  file { '/etc/default/shellinabox' :
    source => 'puppet:///modules/website/default/shellinabox',
    notify => Service['shellinabox'],
  }
}
