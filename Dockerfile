FROM fedora:40

# Added packages for ice to build
RUN dnf install -y git make g++ libmcpp-devel openssl-devel bzip2-devel lmdb-devel expat-devel libedit-devel && dnf clean all && rm -rf /var/cache/yum

# Cloning Ice repo, tag v3.7.10 (-b v3.7.10) with minimal git history (--depth 1)
RUN git clone --depth 1 -b v3.7.10 https://github.com/zeroc-ice/ice

# Compiling (ZeroC) ICE from source
RUN cd ice/cpp && make -j

# make install didn't seem to work so manually copying
RUN cd ice/cpp/bin && cp * /usr/bin/

# Cleanup Source
RUN rm -R ice
