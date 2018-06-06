# jemalloc custom RPM Build

[jemalloc](https://github.com/jemalloc/jemalloc) custom RPM Build for CentOS 7 based [Centmin Mod LEMP stack](https://centminmod.com)

```
yum -q info jemalloc-custom
Installed Packages
Name        : jemalloc-custom
Arch        : x86_64
Version     : 5.1.0
Release     : 1.el7
Size        : 42 M
Repo        : installed
Summary     : jemalloc-custom-5.1.0 for centminmod.com LEMP stack installs
URL         : https://centminmod.com
License     : unknown
Description : jemalloc-custom-5.1.0 for centminmod.com LEMP stack
```

```
rpm -ql jemalloc-custom 
/opt/jemalloc/bin/jemalloc-config
/opt/jemalloc/bin/jemalloc.sh
/opt/jemalloc/bin/jeprof
/opt/jemalloc/include/jemalloc/jemalloc.h
/opt/jemalloc/lib/libjemalloc.a
/opt/jemalloc/lib/libjemalloc.so
/opt/jemalloc/lib/libjemalloc.so.2
/opt/jemalloc/lib/libjemalloc_pic.a
/opt/jemalloc/lib/pkgconfig/jemalloc.pc
```

```
/opt/jemalloc/bin/jemalloc-config --version
5.1.0-0-g1

/opt/jemalloc/bin/jemalloc-config --config
--prefix=/opt/jemalloc --libdir=/opt/jemalloc/lib --includedir=/opt/jemalloc/include --with-version=5.1.0-0-g1 --with-jemalloc-prefix=je_ CC=gcc CXX=g++

/opt/jemalloc/bin/jemalloc-config --prefix
/opt/jemalloc

/opt/jemalloc/bin/jemalloc-config --libdir
/opt/jemalloc/lib

/opt/jemalloc/bin/jemalloc-config --includedir
/opt/jemalloc/include

/opt/jemalloc/bin/jemalloc-config --cflags
-std=gnu11 -Wall -Wsign-compare -Wundef -Wno-format-zero-length -pipe -g3 -fvisibility=hidden -O3 -funroll-loops

/opt/jemalloc/bin/jemalloc-config --cxxflags
-fvisibility=hidden -O3

/opt/jemalloc/bin/jemalloc-config --cppflags
-D_GNU_SOURCE -D_REENTRANT

/opt/jemalloc/bin/jemalloc-config --cc
gcc

/opt/jemalloc/bin/jemalloc-config --libs
-lm  -lpthread -ldl
```