define apache2::disable_module ($modname) {
  include apache2

  exec { "apache2-disable_module-$modname":
    command => "a2dismod $modname",
    onlyif  => "test -f /etc/apache2/mods-enabled/$modname.load",
    require => Package[$apache2::package],
    notify  => Service["apache2"],
  }
}
