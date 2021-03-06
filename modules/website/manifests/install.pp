class website::install {
  group { 'guest':
    ensure => 'present',
    gid    => '501',
  }
  user { 'guest':
    ensure   => 'present',
    uid      => '501',
    gid      => '501',
    home     => '/home/guest',
    shell    => '/bin/bash',
    require  => Group['guest'],
  }
  package { [ 'ssh', 'shellinabox' ] :
    ensure  => 'installed',
  }
  file { '/chroot/home/guest/.ssh' :
    ensure  => 'directory',
    owner   => 'root',
    group   => 'guest',
    mode    => '0740',
    require => User['guest'],
  }
  file { '/home/guest' :
    ensure  => 'symlink',
    target  => '/chroot/home/guest',
  }
  file { '/chroot/home/guest' :
    ensure => 'directory',
    owner  => 'root',
    group  => 'guest',
    mode  => '660',
    require => User['guest'],
  }
}
