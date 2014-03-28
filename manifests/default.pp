group{ 'puppet': ensure  => present }

node 'aptly.local' {
  include aptly
}
