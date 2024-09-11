#!/bin/bash

set -e

# Set variables
JEMALLOCVER=5.3.0
RUBYVER=3.1.6
JEMALLOC_LIBDIR=/usr/local/nginx-dep

# Determine DISTTAG based on OS release
if grep -q "release 8" /etc/redhat-release; then
    DISTTAG='el8'
elif grep -q "release 9" /etc/redhat-release; then
    DISTTAG='el9'
fi

# Install dependencies
dnf install -y epel-release &&
dnf groupinstall 'Development Tools' -y &&
dnf install -y \
  wget \
  gcc \
  make \
  rpmdevtools \
  tar \
  curl \
  gnupg2 \
  libffi-devel \
  readline-devel \
  openssl \
  openssl-devel \
  zlib-devel \
  sqlite-devel \
  xz \
  xz-devel \
  xz-libs \
  gcc-toolset-13-* --skip-broken

# Import RVM GPG keys and install Ruby ${RUBYVER}
gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB ||
(curl -sSL https://rvm.io/mpapis.asc | gpg2 --import && curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import)
curl -sSL https://get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
export RUBY_CONFIGURE_OPTS='--with-openssl-dir=/usr'
rvm install ${RUBYVER} --with-openssl-dir=/usr
rvm use ${RUBYVER} --default
rvm alias create default ${RUBYVER}
ruby -v
gem install --no-document fpm

# Build jemalloc
wget "https://github.com/jemalloc/jemalloc/archive/refs/tags/${JEMALLOCVER}.tar.gz" -O "jemalloc-${JEMALLOCVER}.tar.gz"
tar xzf "jemalloc-${JEMALLOCVER}.tar.gz"
cd "jemalloc-${JEMALLOCVER}"

# Configure and build jemalloc
./autogen.sh
./configure --prefix=${JEMALLOC_LIBDIR} --libdir=${JEMALLOC_LIBDIR}/lib --includedir=${JEMALLOC_LIBDIR}/include --with-version=${JEMALLOCVER}-0-g1 --with-jemalloc-prefix=je_ --with-malloc-conf='background_thread:true,dirty_decay_ms:1000,muzzy_decay_ms:1000'
make -j$(nproc) build_lib_shared
make -j$(nproc) build_lib_static

# Install jemalloc to temporary directory
rm -rf /tmp/installdir
mkdir -p /tmp/installdir
make install_lib_shared DESTDIR=/tmp/installdir
make install_lib_static DESTDIR=/tmp/installdir
make install_include DESTDIR=/tmp/installdir
make install_bin DESTDIR=/tmp/installdir
make install_lib_pc DESTDIR=/tmp/installdir

# Create RPM using fpm
echo "* $(date +"%a %b %d %Y") George Liu <centminmod.com> ${JEMALLOCVER}" > "jemalloc-${JEMALLOCVER}-changelog"
echo "- jemalloc ${JEMALLOCVER} for custom Nginx" >> "jemalloc-${JEMALLOCVER}-changelog"
echo
cat "jemalloc-${JEMALLOCVER}-changelog"
echo

fpm -s dir -t rpm \
-n jemalloc-custom \
-v ${JEMALLOCVER} \
--rpm-compression xz \
--rpm-changelog "jemalloc-${JEMALLOCVER}-changelog" \
--rpm-summary "jemalloc ${JEMALLOCVER} for custom Nginx" \
--rpm-dist "$DISTTAG" \
--description "jemalloc ${JEMALLOCVER} for custom Nginx stacks" \
--url "https://centminmod.com" \
--rpm-autoreqprov \
--rpm-rpmbuild-define "_build_id_links none" \
--verbose \
-p "/workspace" \
-C /tmp/installdir

