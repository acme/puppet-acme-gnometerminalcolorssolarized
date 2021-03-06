# == Class: gnometerminalcolorssolarized
#
# This is the gnometerminalcolorssolarized module. It installs
# gnome-terminal-colors-solarized for a user and changes their Gnome Terminal
# colours to solarized.
#
# gnome-terminal-colors-solarized is a script for setting the Solarized color
# set with Gnome Terminal.
#
# === Parameters
#
# None.
#
# === Variables
#
# None.
#
# === Examples
#
#  class { 'gnometerminalcolorssolarized': }
#  gnometerminalcolorssolarized::install { 'acme': }
#
# === Authors
#
# Leon Brocard acme@astray.com
#
# === Copyright
#
# Copyright 2013 Leon Brocard.
#
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
    unless  => '/usr/bin/gconftool-2 --get /apps/gnome-terminal/profiles/Solarized/visible_name',
    require => Exec['gnometerminalcolorssolarized::git clone'],
  }

}
