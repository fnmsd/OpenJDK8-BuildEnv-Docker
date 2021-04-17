FROM ubuntu:16.04
WORKDIR /
RUN apt update && apt-get -y install  build-essential gdb  cmake openjdk-8-jdk cpio file unzip zip wget&&apt-get -y install  --no-install-recommends  libfontconfig1-dev libfreetype6-dev  libcups2-dev libx11-dev  libxext-dev  libxrender-dev  libxrandr-dev  libxtst-dev  libxt-dev libasound2-dev  libffi-dev  autoconf 
RUN wget http://ftp.gnu.org/gnu/make/make-3.81.tar.gz && tar -zxvf make-3.81.tar.gz && cd /make-3.81 && bash configure -prefix=/usr && make && make install
ADD build_jdk.sh /build_jdk.sh
RUN chmod 755 /build_jdk.sh
CMD ["/build_jdk.sh"]