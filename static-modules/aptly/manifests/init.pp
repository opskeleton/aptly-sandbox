# aptly setup
class aptly {
  apt::source { 'aptly':
    location    => 'http://repo.aptly.info/',
    repos       => 'main',
    key         => '2A194991',
    key_server  => 'pgp.mit.edu',
    release     => 'squeeze',
    include_src => false
  } ->

  package{'aptly':
    ensure  => present
  }

  package{'bzip2':
    ensure  => present
  }

  file { '/etc/aptly.conf':
    ensure => file,
    mode   => '0644',
    source => 'puppet:///modules/aptly/aptly.conf',
    owner  => root,
    group  => root,
  }

  if($::virtual == 'docker') {
    file{'/etc/service/aptly':
      ensure => directory,
    }

    file { '/etc/service/aptly/run':
      ensure => file,
      mode   => 'u+x',
      source => 'puppet:///modules/aptly/aptly_run',
      owner  => root,
      group  => root,
    }
  }
}
