package Sledge::Session::Memcached;

use strict;
use base qw(Sledge::Session);
use Cache::Memcached;
use vars qw($VERSION);
$VERSION = '0.02';

use vars qw($SessionExpires);
$SessionExpires = 24 * 60 * 60; # 24hour

sub _connect_database    { 
    my($self, $page) = @_;
    my $config = $page->create_config;
    my $servers = $config->session_servers;
    my $memd = Cache::Memcached->new({
	servers => $servers,
	debug => 0,
    });
    return $memd;
}

sub _select_me { 
    my($self, $opt) = @_;
    my $sid = $self->{_sid};
    my $data = $self->{_dbh}->get($sid);
    unless ($data) {
	Sledge::Exception::SessionIdNotFound->throw(
	    'no such session_id in database.',
	);
    }
    $self->{_data} = $data;
}

sub _insert_me {
    my $self = shift;
    $self->{_dbh}->set($self->{_sid}, $self->{_data}, $SessionExpires);
}

sub _update_me {
    my $self = shift;
    $self->{_dbh}->replace($self->{_sid}, $self->{_data}, $SessionExpires);
}

sub _delete_me           { 
    my $self = shift;
    $self->{_dbh}->delete($self->{_sid});
}

sub _do_cleanup          {}
sub _commit              {}

# XXX No Locking 
sub _do_lock             {}
sub _lockid              {}

1;
__END__

=head1 NAME

Sledge::Session::Memcached - use memcached as Sledge session storage.

=head1 VERSION

Version 0.01

=head1 SYNOPSIS

 use Sledge::Pages::Compat;
 use Sledge::Session::Memcached;

 sub create_session {
     my($self, $sid) = @_;
     return Sledge::Session::Memcached->new($self, $sid);
 }

=head1 AUTHOR

Tomohiro IKEBE, C<< <ikebe@livedoor.jp> >>

=head1 COPYRIGHT & LICENSE

Copyright 2005 Tomohiro IKEBE, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.



