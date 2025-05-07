## 编译说明

1. **编译**

```bash
cd tpch-kit/dbgen

# 编译
rm -rf ./dist/bin && \
mkdir -p ./dist/bin && \
make clean && make MACHINE=LINUX DATABASE=MYSQL && \
mv ./dbgen ./dist/bin/dbgen-mysql && \
make clean && make MACHINE=LINUX DATABASE=POSTGRESQL && \
mv ./dbgen ./dist/bin/dbgen-postgresql && \
make clean && make MACHINE=LINUX DATABASE=ORACLE && \
mv ./dbgen ./dist/bin/dbgen-oracle && \
make clean && make MACHINE=LINUX DATABASE=INFORMIX && \
mv ./dbgen ./dist/bin/dbgen-informix && \
make clean && make MACHINE=LINUX DATABASE=DB2 && \
mv ./dbgen ./dist/bin/dbgen-db2 && \
make clean && make MACHINE=LINUX DATABASE=SQLSERVER && \
mv ./dbgen ./dist/bin/dbgen-sqlserver && \
cp ./dists.dss column_split.sh ./dist/bin/ 
```

2. **打包**

```bash
cd tpch-kit/dbgen

rm -rf tpch && \
mkdir -p tpch && \
cp -r dist/* tpch/ && \
tar czf tpch_2_13_0.tar.gz ./tpch
```


tpch-kit
========

TPC-H benchmark kit with some modifications/additions

Official TPC-H benchmark - [http://www.tpc.org/tpch](http://www.tpc.org/tpch)

## Modifications

The following modifications have been added on top of the official TPC-H kit:

* modify `dbgen` to not print trailing delimiter
* add option for `dbgen` to output to stdout
* add compile support for macOS
* add define for PostgreSQL to support `LIMIT N` for `qgen`
* adjust `Makefile` defaults

## Setup

### Linux

Make sure the required development tools are installed:

Ubuntu:
```
sudo apt-get install git make gcc
```

CentOS/RHEL:
```
sudo yum install git make gcc
```

Then run the following commands to clone the repo and build the tools:

```
git clone https://github.com/gregrahn/tpch-kit.git
cd tpch-kit/dbgen
make MACHINE=LINUX DATABASE=POSTGRESQL
```

### macOS

Make sure the required development tools are installed:

```
xcode-select --install
```

Then run the following commands to clone the repo and build the tools:

```
git clone https://github.com/gregrahn/tpch-kit.git
cd tpch-kit/dbgen
make MACHINE=MACOS DATABASE=POSTGRESQL
```

## Using the TPC-H tools

### Environment

Set these env variables correctly:

```
export DSS_CONFIG=/.../tpch-kit/dbgen
export DSS_QUERY=$DSS_CONFIG/queries
export DSS_PATH=/path-to-dir-for-output-files
```

### SQL dialect

See `Makefile` for the valid `DATABASE` values.  Details for each dialect can be found in `tpcd.h`.  Adjust the query templates in `tpch-kit/dbgen/queries` as need be.

### Data generation

Data generation is done via `dbgen`.  See `dbgen -h` for all options.  The environment variable `DSS_PATH` can be used to set the desired output location.

### Query generation

Query generation is done via `qgen`.  See `qgen -h` for all options.

The following command can be used to generate all 22 queries in numerical order for the 1GB scale factor (`-s 1`) using the default substitution variables (`-d`).

```
qgen -v -c -d -s 1 > tpch-stream.sql
```

To generate one query per file for SF 3000 (3TB) use:

```
for ((i=1;i<=22;i++)); do
  ./qgen -v -c -s 3000 ${i} > /tmp/sf3000/tpch-q${i}.sql
done
```
