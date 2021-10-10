
# Setup bht scripts
class bht (
  String                $git_package,
  Boolean               $git_manage,
  Boolean               $repo_manage,
  Enum[present, absent] $repo_ensure,
  Stdlib::Httpsurl      $repo_source,
  Stdlib::Absolutepath  $repo_directory,
  String                $repo_revision,
  Stdlib::Absolutepath  $install_directory,
  Stdlib::Absolutepath  $home_directory,
  Array[String[1]]      $package_dependencies,
) {

  anchor { "${module_name}::begin": }
  -> class {"${module_name}::dependencies":}
  -> class {"${module_name}::config":}
  -> class {"${module_name}::install":}
  -> anchor { "${module_name}::end": }
}
