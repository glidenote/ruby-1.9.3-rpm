#!/bin/sh

rubyminorver="327"

sudo yum install -y rpm-build rpmdevtools readline-devel ncurses-devel gdbm-devel tcl-devel openssl-devel db4-devel byacc libyaml-devel
rpmdev-setuptree
cd ~/rpmbuild/SOURCES
wget http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p${rubyminorver}.tar.gz
cd ~/rpmbuild/SPECS
wget https://raw.github.com/glidenote/ruby-1.9.3-rpm/master/ruby19.spec
rpmbuild -bb ruby19.spec
ARCH=`uname -m`
sudo rpm -Uvh  ~/rpmbuild/RPMS/${ARCH}/ruby-1.9.3p${rubyminorver}-1.${ARCH}.rpm
