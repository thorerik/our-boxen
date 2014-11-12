class projects::etsirc {
  boxen::project { 'etsirc':
    nginx     => true,
    ruby      => '2.1.2',
    nodejs    => 'v0.10.29',
    source    => 'git@cougar.ctmg.eu:ets-irc/website.git',
    dir       => "${boxen::config::srcdir}/etsirc/website",
  }
}
