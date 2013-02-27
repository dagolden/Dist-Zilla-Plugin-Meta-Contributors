use 5.006;
use strict;
use warnings;
use Test::More 0.96;

use Test::DZil;

my $root = 'corpus/DZ';

my @CONTRIBUTORS = (
    'Wile E Coyote <coyote@example.com>',
    'Road Runner <fast@example.com>',
);

{
    my $tzil = Dist::Zilla::Tester->from_config(
        { dist_root => $root },
    );
    ok($tzil, "created test dist");

    $tzil->build;

    is_deeply( $tzil->distmeta->{x_contributors}, \@CONTRIBUTORS, "x_contributors correct" );
}

done_testing;
# COPYRIGHT
