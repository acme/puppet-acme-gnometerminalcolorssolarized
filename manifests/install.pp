define gnometerminalcolorssolarized::install() {

  exec { 'gnometerminalcolorssolarized::git clone':
    creates => "/home/${name}/.gnometerminalcolorssolarized",
    command => "/usr/bin/git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git /home/${name}/.gnometerminalcolorssolarized",
    user    => $name,
    require => [Package['git']],
    notify  => Exec['gnometerminalcolorssolarized::solarize'],
  }

  exec { 'gnometerminalcolorssolarized::solarize':
    command => "/home/${name}/.gnometerminalcolorssolarized/solarize",
    cwd     => "/home/${name}/.gnometerminalcolorssolarized/",
    user    => $name,
    require => Exec['gnometerminalcolorssolarized::git clone'],
  }

}
