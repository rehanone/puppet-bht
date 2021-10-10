class bht::config () inherits bht {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  file { $bht::home_directory:
    ensure => directory,
    path   => $bht::home_directory,
    owner  => 'root',
    group  => 'root',
  }
}
