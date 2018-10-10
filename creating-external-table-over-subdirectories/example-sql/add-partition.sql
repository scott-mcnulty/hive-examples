ALTER TABLE example_table ADD PARTITION (
    subdirectory='2018-09-30'
)
LOCATION '/common-dir/2018/09/30/'