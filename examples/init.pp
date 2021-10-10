node default {

  notify { 'enduser-before': }
  notify { 'enduser-after': }

  class { 'bht':
    ensure  => present,
    require => Notify['enduser-before'],
    before  => Notify['enduser-after'],
  }
}
