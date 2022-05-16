# jemalloc custom RPM Build

[jemalloc](https://github.com/jemalloc/jemalloc) custom RPM Build for Centmin Mod's Nginx binary on CentOS 7 & Alma Linux/Rocky Linux 8 based [Centmin Mod LEMP stack](https://centminmod.com)

EL7

```
yum -q info jemalloc-custom
Installed Packages
Name        : jemalloc-custom
Arch        : x86_64
Version     : 5.3.0
Release     : 1.el7
Size        : 95 M
Repo        : installed
From repo   : /jemalloc-custom-5.3.0-1.el7.x86_64
Summary     : jemalloc-custom-5.3.0 for centminmod.com LEMP stack installs
URL         : https://centminmod.com
License     : unknown
Description : jemalloc-custom-5.3.0 for centminmod.com LEMP stacks
```

EL8

```
yum -q info jemalloc-custom
Installed Packages
Name         : jemalloc-custom
Version      : 5.3.0
Release      : 1.el8
Architecture : x86_64
Size         : 97 M
Source       : jemalloc-custom-5.3.0-1.el8.src.rpm
Repository   : @System
From repo    : @commandline
Summary      : jemalloc-custom-5.3.0 for centminmod.com LEMP stack installs
URL          : https://centminmod.com
License      : unknown
Description  : jemalloc-custom-5.3.0 for centminmod.com LEMP stack
```

EL7

```
rpm -ql jemalloc-custom
/usr/local/nginx-dep/bin/jemalloc-config
/usr/local/nginx-dep/bin/jemalloc.sh
/usr/local/nginx-dep/bin/jeprof
/usr/local/nginx-dep/include/jemalloc/jemalloc.h
/usr/local/nginx-dep/lib/libjemalloc.a
/usr/local/nginx-dep/lib/libjemalloc.so
/usr/local/nginx-dep/lib/libjemalloc.so.2
/usr/local/nginx-dep/lib/libjemalloc_pic.a
/usr/local/nginx-dep/lib/pkgconfig/jemalloc.pc
```

EL8

```
rpm -ql jemalloc-custom
/usr/lib/.build-id
/usr/lib/.build-id/6c
/usr/lib/.build-id/6c/683a377fbc1faa1ff974fecf956914ae206089
/usr/local/nginx-dep/bin/jemalloc-config
/usr/local/nginx-dep/bin/jemalloc.sh
/usr/local/nginx-dep/bin/jeprof
/usr/local/nginx-dep/include/jemalloc/jemalloc.h
/usr/local/nginx-dep/lib/libjemalloc.a
/usr/local/nginx-dep/lib/libjemalloc.so
/usr/local/nginx-dep/lib/libjemalloc.so.2
/usr/local/nginx-dep/lib/libjemalloc_pic.a
/usr/local/nginx-dep/lib/pkgconfig/jemalloc.pc
```

EL7

```
/usr/local/nginx-dep/bin/jemalloc-config --version
5.3.0-0-g1

/usr/local/nginx-dep/bin/jemalloc-config --config
--prefix=/usr/local/nginx-dep --libdir=/usr/local/nginx-dep/lib --includedir=/usr/local/nginx-dep/include --with-version=5.3.0-0-g1 --with-jemalloc-prefix=je_ CC=gcc CXX=g++

/usr/local/nginx-dep/bin/jemalloc-config --prefix
/usr/local/nginx-dep

/usr/local/nginx-dep/bin/jemalloc-config --libdir
/usr/local/nginx-dep/lib

/usr/local/nginx-dep/bin/jemalloc-config --includedir
/usr/local/nginx-dep/include

/usr/local/nginx-dep/bin/jemalloc-config --cflags
-std=gnu11 -Wall -Wextra -Wsign-compare -Wundef -Wno-format-zero-length -Wpointer-arith -Wno-missing-braces -Wno-missing-field-initializers -Wno-missing-attributes -pipe -g3 -fvisibility=hidden -Wimplicit-fallthrough -O3 -funroll-loops

/usr/local/nginx-dep/bin/jemalloc-config --cxxflags
-Wall -Wextra -g3 -fvisibility=hidden -Wimplicit-fallthrough -O3

/usr/local/nginx-dep/bin/jemalloc-config --cppflags
-D_GNU_SOURCE -D_REENTRANT

/usr/local/nginx-dep/bin/jemalloc-config --cc
gcc

/usr/local/nginx-dep/bin/jemalloc-config --libs
-lm -lstdc++ -pthread -ldl
```

EL8

```
/usr/local/nginx-dep/bin/jemalloc-config --version
5.3.0-0-g1

/usr/local/nginx-dep/bin/jemalloc-config --config
--prefix=/usr/local/nginx-dep --libdir=/usr/local/nginx-dep/lib --includedir=/usr/local/nginx-dep/include --with-version=5.3.0-0-g1 --with-jemalloc-prefix=je_ 'CC=ccache gcc' 'CXX=ccache g++'

/usr/local/nginx-dep/bin/jemalloc-config --prefix
/usr/local/nginx-dep

/usr/local/nginx-dep/bin/jemalloc-config --libdir
/usr/local/nginx-dep/lib

/usr/local/nginx-dep/bin/jemalloc-config --includedir
/usr/local/nginx-dep/include

/usr/local/nginx-dep/bin/jemalloc-config --cflags
-std=gnu11 -Wall -Wextra -Wsign-compare -Wundef -Wno-format-zero-length -Wpointer-arith -Wno-missing-braces -Wno-missing-field-initializers -Wno-missing-attributes -pipe -g3 -fvisibility=hidden -Wimplicit-fallthrough -O3 -funroll-loops

/usr/local/nginx-dep/bin/jemalloc-config --cxxflags
-Wall -Wextra -g3 -fvisibility=hidden -Wimplicit-fallthrough -O3

/usr/local/nginx-dep/bin/jemalloc-config --cppflags
-D_GNU_SOURCE -D_REENTRANT

/usr/local/nginx-dep/bin/jemalloc-config --cc
ccache gcc

/usr/local/nginx-dep/bin/jemalloc-config --libs
-lm -lstdc++ -pthread -ldl
```

```
echo "LD_PRELOAD=$(/usr/local/nginx-dep/bin/jemalloc-config --libdir)/libjemalloc.so.$(/usr/local/nginx-dep/bin/jemalloc-config --revision)"
LD_PRELOAD=/usr/local/nginx-dep/lib/libjemalloc.so.2
```

```
echo "-I$(/usr/local/nginx-dep/bin/jemalloc-config --includedir) -L$(/usr/local/nginx-dep/bin/jemalloc-config --libdir) -W-rpath,$(/usr/local/nginx-dep/bin/jemalloc-config --libdir) -ljemalloc $(/usr/local/nginx-dep/bin/jemalloc-config --libs)"

-I/usr/local/nginx-dep/include -L/usr/local/nginx-dep/lib -W-rpath,/usr/local/nginx-dep/lib -ljemalloc -lm -lstdc++ -pthread -ldl
```

Centmin Mod Nginx EL7

```
nginx -V
nginx version: nginx/1.21.6 (160522-210322-centos7-084a0c4-br-6e975bc)
built by gcc 10.2.1 20210130 (Red Hat 10.2.1-11) (GCC) 
built with OpenSSL 1.1.1o  3 May 2022
TLS SNI support enabled
```
> configure arguments: --with-ld-opt='-Wl,-E -L/usr/local/nginx-dep/lib -lpcre2-8 -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/nginx-dep/lib:/usr/local/nginx-dep/lib -B/usr/local/libexec/mold' --with-cc-opt='-I/usr/local/nginx-dep/include -m64 -march=native -DTCP_FASTOPEN=23 -falign-functions=32 -g -O3 -Wno-strict-aliasing -fstack-protector-strong -B/usr/local/libexec/mold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wno-pointer-sign -Wimplicit-fallthrough=0 -Wno-missing-profile -Wno-implicit-function-declaration -Wno-int-conversion -Wno-unused-result -Wno-unused-result -fcode-hoisting -Wp,-D_FORTIFY_SOURCE=2 -Wno-deprecated-declarations' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --build=160522-210322-centos7-084a0c4-br-6e975bc --with-compat --with-http_auth_request_module --with-http_stub_status_module --with-http_secure_link_module --with-http_flv_module --with-http_mp4_module --add-module=../nginx-rtmp-module --add-dynamic-module=../nginx-module-vts --with-libatomic --with-http_gzip_static_module --add-dynamic-module=../ngx_brotli --add-dynamic-module=../ngx_http_geoip2_module --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --add-dynamic-module=../njs/nginx --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream --with-stream_ssl_module --with-http_slice_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.5.1 --add-dynamic-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.32 --add-dynamic-module=../echo-nginx-module-0.62 --add-module=../redis2-nginx-module-0.15 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.19 --add-module=../srcache-nginx-module-0.32 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre-jit --with-zlib=../zlib-1.2.12 --with-http_ssl_module --with-http_v2_module --with-http_v2_hpack_enc --with-openssl=../openssl-1.1.1o

Centmin Mod Nginx EL8

```
nginx -V
nginx version: nginx/1.21.6 (160522-171726-almalinux8-kvm-d9af520)
built by gcc 10.3.1 20210422 (Red Hat 10.3.1-1) (GCC) 
built with OpenSSL 1.1.1o  3 May 2022
TLS SNI support enabled
```
> configure arguments: --with-ld-opt='-Wl,-E -L/usr/local/nginx-dep/lib -ljemalloc -Wl,-z,relro -Wl,-rpath,/usr/local/nginx-dep/lib -B/usr/local/libexec/mold' --with-cc-opt='-I/usr/local/nginx-dep/include -m64 -march=native -DTCP_FASTOPEN=23 -g -O3 -fstack-protector-strong -B/usr/local/libexec/mold --param=ssp-buffer-size=4 -Wformat -Werror=format-security -Wno-pointer-sign -Wimplicit-fallthrough=0 -Wno-implicit-function-declaration -Wno-int-conversion -Wno-error=unused-result -Wno-unused-result -fcode-hoisting -Wno-cast-function-type -Wno-format-extra-args -Wp,-D_FORTIFY_SOURCE=2' --sbin-path=/usr/local/sbin/nginx --conf-path=/usr/local/nginx/conf/nginx.conf --build=160522-171726-almalinux8-kvm-d9af520 --with-compat --without-pcre2 --with-http_stub_status_module --with-http_secure_link_module --with-libatomic --with-http_gzip_static_module --with-http_sub_module --with-http_addition_module --with-http_image_filter_module=dynamic --with-http_geoip_module --with-stream_geoip_module --with-stream_realip_module --with-stream_ssl_preread_module --with-threads --with-stream --with-stream_ssl_module --with-http_realip_module --add-dynamic-module=../ngx-fancyindex-0.4.2 --add-module=../ngx_cache_purge-2.5.1 --add-dynamic-module=../ngx_devel_kit-0.3.0 --add-dynamic-module=../set-misc-nginx-module-0.32 --add-dynamic-module=../echo-nginx-module-0.62 --add-module=../redis2-nginx-module-0.15 --add-module=../ngx_http_redis-0.3.7 --add-module=../memc-nginx-module-0.19 --add-module=../srcache-nginx-module-0.32 --add-dynamic-module=../headers-more-nginx-module-0.33 --with-pcre-jit --with-zlib=../zlib-1.2.12 --with-http_ssl_module --with-http_v2_module --with-openssl=../openssl-1.1.1o --with-openssl-opt='enable-ec_nistp_64_gcc_128 enable-tls1_3 -B/usr/local/libexec/mold'