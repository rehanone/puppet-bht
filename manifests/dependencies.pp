class bht::dependencies () inherits bht {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  if $bht::manage {
    ensure_packages([$bht::core_dependencies], { 'ensure' => present })

    ensure_packages([$bht::additional_dependencies], { 'ensure' => $bht::ensure })
  }

  if $bht::git_manage {
    ensure_packages([$bht::git_package], { 'ensure' => $bht::ensure })
  }
}
