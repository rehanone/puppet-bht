
# Setup bht scripts
class bht (
  String                $git_package,
  Boolean               $git_manage,
  Boolean               $manage,
  Enum[present, absent] $ensure,
  Stdlib::Httpsurl      $repo_source,
  Stdlib::Absolutepath  $repo_directory,
  String                $repo_revision,
  Stdlib::Absolutepath  $install_directory,
  Stdlib::Absolutepath  $home_directory,
  Array[String[1]]      $core_dependencies,
  Array[String[1]]      $additional_dependencies,
) {

  anchor { "${module_name}::begin": }
  -> class {"${module_name}::dependencies":}
  -> class {"${module_name}::config":}
  -> class {"${module_name}::install":}
  -> anchor { "${module_name}::end": }
}
