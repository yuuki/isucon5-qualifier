use strict;
use warnings;
use utf8;

use Isucon5::Web;

my $query = <<SQL;
SELECT user_id, owner_id, unix_timestamp(created_at) as epoch, created_at_date
FROM footprints
ORDER BY created_at DESC
SQL

# powerful importer

# initialize
my $redis = Isucon5::Web::redis;
$redis->flushall();
my $db = Isucon5::Web::db;
for my $row (@{$db->select_all($query)}) {
    Isucon5::Web::mark_footprint_redis_raw(
        $row->{owner_id}, $row->{user_id}, $row->{epoch}, $row->{created_at_date}
    );
}
