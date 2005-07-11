use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Sledge::Session::Memcached',
    license             => 'perl',
    dist_author         => 'Tomohiro IKEBE <ikebe@livedoor.jp>',
    dist_version_from   => 'lib/Sledge/Session/Memcached.pm',
    requires => {
        'Test::More' => 0,
	'Cache::Memcached' => 0,
    },
    add_to_cleanup      => [ 'Sledge-Session-Memcached-*' ],
);

$builder->create_build_script();
