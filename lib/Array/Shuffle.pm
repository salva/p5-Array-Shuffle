package Array::Shuffle;

our $VERSION = '0.01';

use strict;
use warnings;

require XSLoader;
XSLoader::load('Array::Shuffle', $VERSION);

require Exporter;
our @ISA = qw(Exporter);
our @EXPORT_OK = qw(shuffle_array);

1;
__END__

=head1 NAME

Array::Shuffle - fast shuffling of arrays in-place

=head1 SYNOPSIS

  use Array::Shuffle qw(shuffle_array);
  shuffle_array(@a);

=head1 DESCRIPTION

This module implements the C<shuffle_array> function for shuffling and
array in-place.

=head1 SEE ALSO

L<List::Util>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2012 by Salvador FandiE<ntilde>o (sfandino@yahoo.com)

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

=cut
