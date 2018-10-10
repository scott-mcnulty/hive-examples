# Creating External Table Over Subdirectories

This is an example to show how one can create an external Hive table over many directories by using partition.

## Table of Contents

- [Creating External Table Over Subdirectories](#creating-external-table-over-subdirectories)
    - [Table of Contents](#table-of-contents)
    - [The Raw File Directory Strucute](#the-raw-file-directory-strucute)
    - [Creating the External Table](#creating-the-external-table)
    - [Creating the Partitions](#creating-the-partitions)
    - [Conclusion](#conclusion)

## The Raw File Directory Strucute

For this example the structure of the raw data could look something like the example below where the data is separated by a column `DATETIME`. The data in each subdirectory contains the respective values for the `DATETIME` column so, for example, /common-dir/2018/09/30 contains `DATETIME` values of 2018-09-30.

```sh
/common-dir/2018/09/30
/common-dir/2018/10/01
/common-dir/2018/10/03
/common-dir/2018/10/02
.
.
.
```

See how there is a portion of the directories that are common and then parts that branch off? The parts of the paths that are common between the different directories will be where the external table will look and the subdirectories are where the partitions will exist.

## Creating the External Table

This is an example create table statement:

```sh
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
```

After creating the table if you try a `SELECT * FROM example_table;` nothing will be given back. This is because there is currently no data for the table to look at. For this we need to create partitions.

## Creating the Partitions

To create a partition we can execute a command such as:

```sh
ALTER TABLE example_table ADD PARTITION (
    subdirectory='2018-09-30')
LOCATION '/common-dir/2018/09/30/'
```

No when we run the command `SELECT * FROM example_table;` we get data back where the values of the `DATETIME` column contain 2018-09-30. If more subdirectories exist we can add more partitions but point to those directories instead.

Run the command `SHOW PARTITIONS example_table;` to see all the created partitions.

## Conclusion

We have successfully created a table with multiple partitions as subdirectories. Now any time data is added in another subdirectory we can add another partition so we can view the data via the Hive table.

If data is being ingested by some tool such as a NiFi the partition can be made alongside flow execution.