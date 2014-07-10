# == Class: pptpd
#
# Install and configure pptpd
#
# === Parameters
#
# [ensure]
# defaults to 'present', if so it installs and configure pptpd, otherwise
# it will remove config files and package
#
# === Examples
#
# include 'pptpd'
# pptpd::user { 'myuser': password => 'mysecret' }
#
# === Authors
#
# Alexander Fortin <alexander.fortin@gmail.com>
#
class pptpd (
  $ensure      = 'present',
  $option      = '/etc/ppp/pptpd-options',
  $stimeout    = 60,
  $debug       = false,
  $bcrelay     = false,
  $connections = 100,
  $remoteip    = '10.0.0.235-254',
  $noipparam   = false,
  $listen      = true,
  $pidfile     = '/var/run/pptpd.pid',
  $logwtmp     = true
  ) {

  include 'pptpd::package'
  include 'pptpd::config'
  include 'pptpd::service'

  Class['pptpd::config'] ~> Class['pptpd::service']

}
