# == Class: gnometerminalcolorssolarized
#
# This is the gnometerminalcolorssolarized module. It installs
# gnome-terminal-colors-solarized for a user and changes their Gnome Terminal
# colours to solarized.
#
# gnome-terminal-colors-solarized is a scripts for setting the Solarized color
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
class gnometerminalcolorssolarized {

  if(!defined(Package['git'])) {
    package { 'git':
      ensure => present,
    }
  }

}
