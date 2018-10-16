# Hive Templates and Examples

Here are some examples of situations I've run into when using Hive. Adding them here in case anyone else (or myself) needs a reference to use when setting up similar cases.

## Table of Contents

- [Hive Templates and Examples](#hive-templates-and-examples)
    - [Table of Contents](#table-of-contents)
    - [Creating an External Table Over Subdirectories](#creating-an-external-table-over-subdirectories)

-----

## [Creating an External Table Over Subdirectories](creating-external-table-over-subdirectories/README.md)

This is an example where an external table uses partitions to incorporate data from many different subdirectories. When this was made I wasn't able to change the Hive configuration to use `hive.mapred.supports.subdirectories=TRUE;` and `mapred.input.dir.recursive=TRUE;` so I had to come up with a way around it. In other environments using the previously mentioned settings may be preferable.

[to top](#hive-templates-and-examples)
