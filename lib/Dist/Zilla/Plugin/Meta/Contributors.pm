use 5.008001;
use strict;
use warnings;

package Dist::Zilla::Plugin::Meta::Contributors;
# ABSTRACT: Generate an x_contributors section in distribution metadata

our $VERSION = '0.004';

use Moose;

has contributor => (
    is      => 'ro',
    isa     => 'ArrayRef[Str]',
    default => sub { [] },
);

sub mvp_multivalue_args { qw/contributor/ }

sub metadata {
    my $self = shift;
    if ( @{ $self->contributor } ) {
        return { x_contributors => $self->contributor };
    }
    else {
        return {};
    }
}

with 'Dist::Zilla::Role::MetaProvider';

__PACKAGE__->meta->make_immutable;

1;

=for Pod::Coverage mvp_multivalue_args metadata

=head1 SYNOPSIS

  [Meta::Contributors]
  contributor = Wile E Coyote <coyote@example.com>
  contributor = Road Runner <fast@example.com>

=head1 DESCRIPTION

This module adds author names and email addresses to an C<x_contributors> section
of distribution metadata.

=head1 SEE ALSO

=for :list
* L<Dist::Zilla::Plugin::Git::Contributors> - automatic generation from git commit history, with different ordering options; supports MSWin32
* L<Dist::Zilla::Plugin::ContributorsFromGit> - an older implementation of git generation, with a heavier dependency chain that is sometimes problematic on some architectures

=cut

# vim: ts=4 sts=4 sw=4 et:
