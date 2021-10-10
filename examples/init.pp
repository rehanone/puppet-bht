node default {

  notify { 'enduser-before': }
  notify { 'enduser-after': }

  class { 'bht':
    require     => Notify['enduser-before'],
    before      => Notify['enduser-after'],
  }
}
