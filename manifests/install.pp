class bht::install () inherits bht {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  $file_ensure = $bht::repo_ensure ? {
    'present' => file,
    default   => $bht::repo_ensure,
  }

  if $bht::repo_manage {

    vcsrepo { $bht::repo_directory:
      ensure   => $bht::repo_ensure,
      provider => git,
      source   => $bht::repo_source,
      revision => $bht::repo_revision,
    }

    file { $bht::install_directory:
      ensure => directory,
      path   => $bht::install_directory,
      owner  => 'root',
      group  => 'root',
    }
    -> file { "${bht::install_directory}/bht":
      ensure  => $file_ensure,
      path    => "${bht::install_directory}/bht",
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      content => epp("${module_name}/bht.epp",
        {
          'repo_directory' => $bht::repo_directory,
          'home_directory' => $bht::home_directory,
        }
      ),
    }
    -> file { '/usr/local/bin/bht':
      ensure => link,
      target => "${bht::install_directory}/bht",
    }
  }
}