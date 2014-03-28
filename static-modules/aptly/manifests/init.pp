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
}
