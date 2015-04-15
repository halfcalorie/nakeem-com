node 'default' { 
  include website
  ssh_keygen { 'root':
    comment  => 'website key',
    type     => 'rsa',
    home     => '/chroot/home/guest',
  }
}
