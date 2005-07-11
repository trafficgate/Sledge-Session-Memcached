use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Sledge::Session::Memcached',
    AUTHOR              => 'Tomohiro IKEBE <ikebe@livedoor.jp>',
    VERSION_FROM        => 'lib/Sledge/Session/Memcached.pm',
    ABSTRACT_FROM       => 'lib/Sledge/Session/Memcached.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
	'Cache::Memcached' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Sledge-Session-Memcached-*' },
);
