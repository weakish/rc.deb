#!/usr/bin/perl

# Perl re-implementation of tripping.c

use strict;
use warnings;

use Fcntl qw(F_GETFL F_SETFL O_NONBLOCK);

my ($arg) = @ARGV;
$arg //= '';

if ($arg =~ /^0/) {
    print "tr\0ue\n";
} elsif ($arg =~ /^a/) {
    print "a\001ab\002b\n";
} elsif ($arg =~ /^n/) {
    my $flags = fcntl(STDIN, F_GETFL, 0) or die $!;
    fcntl(STDIN, F_SETFL, $flags | O_NONBLOCK) or die $!;
}

# vim:ts=4 sw=4 et
