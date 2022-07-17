class bht::dependencies () inherits bht {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  if $bht::manage {
    package { [$bht::core_dependencies]: ensure => installed }

    package { [$bht::additional_dependencies]: ensure => $bht::ensure }
  }

  if $bht::git_manage {
    package { [$bht::git_package]: ensure => $bht::ensure }
  }
}
