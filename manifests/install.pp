class bht::install () inherits bht {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  $file_ensure = $bht::ensure ? {
    'present' => file,
    default   => $bht::ensure,
  }

  $directory_ensure = $bht::ensure ? {
    'present' => directory,
    default   => $bht::ensure,
  }

  $link_ensure = $bht::ensure ? {
    'present' => link,
    default   => $bht::ensure,
  }

  if $bht::manage {
    vcsrepo { $bht::repo_directory:
      ensure   => $bht::ensure,
      provider => git,
      source   => $bht::repo_source,
      revision => $bht::repo_revision,
    }
    -> file { $bht::install_directory:
      ensure => $directory_ensure,
      path   => $bht::install_directory,
      owner  => 'root',
      group  => 'root',
      force  => true,
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
      ensure => $link_ensure,
      target => "${bht::install_directory}/bht",
    }
  }
}
