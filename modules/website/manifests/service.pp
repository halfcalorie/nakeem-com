class website::service {
  service { ['ssh','shellinabox'] :
  ensure => 'running',
  }
}
