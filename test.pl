#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use JSON;

use Digest::SHA;
my $sha = Digest::SHA->new(512);
warn $sha->add("harry_gleason5000", 'b958f3')->hexdigest;
warn $sha->add("harry_gleason5000", 'b958f3')->hexdigest;
warn $sha->add("harry_gleason5000", 'b958f3')->hexdigest;

=cut

my $redis;
$redis ||= Redis::Fast->new(
    server => '127.0.0.1:6379',
);
$redis->flushdb;
$redis->lpush('hoge', encode_json +{ a => 1 });
use Data::Dumper;
$Data::Dumper::Indent = 1;
warn Dumper decode_json $redis->lrange('hoge', 0, 1);
