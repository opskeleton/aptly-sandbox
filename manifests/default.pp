group{ 'puppet': ensure  => present }

node /aptly.*/ {
  include aptly
}
