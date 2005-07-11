#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Sledge::Session::Memcached' );
}

diag( "Testing Sledge::Session::Memcached $Sledge::Session::Memcached::VERSION, Perl $], $^X" );
