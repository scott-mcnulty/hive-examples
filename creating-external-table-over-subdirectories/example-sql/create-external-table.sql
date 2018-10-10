CREATE EXTERNAL TABLE IF NOT EXISTS example_table (
    `NAME` STRING,
    `DATETIME` STRING,
    `COL1` STRING,
    `COL2` STRING
    )
COMMENT 'This is an example table for the writeup'
PARTITIONED BY (
    `subdirectory` STRING
)
STORED AS ORC
LOCATION '/common-dir/';