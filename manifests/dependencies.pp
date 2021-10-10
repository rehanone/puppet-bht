class bht::dependencies () inherits bht {

  assert_private("Use of private class ${name} by ${caller_module_name}")

  if $bht::repo_manage {
    ensure_packages([$bht::package_dependencies], { 'ensure' => $bht::repo_ensure })
  }

  if $bht::git_manage {
    ensure_packages([$bht::git_package], { 'ensure' => $bht::repo_ensure })
  }
}
