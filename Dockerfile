FROM gitlab/dind
MAINTAINER Chris Byrd

RUN apt-get -y update
# RUN apt-get install -y --fix-missing curl build-essential g++ unzip wget git zip libgmp-dev ruby-dev
RUN apt-get install -y --fix-missing curl build-essential g++ unzip wget git zip libgmp-dev

RUN git config --global http.sslVerify false
# RUN command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
# RUN \curl -L https://get.rvm.io | bash -s stable

# RUN /bin/bash -l -c "rvm install 2.2.3"
# RUN /bin/bash -l -c "gem install bundler"

# RUN mkdir packer
# RUN cd packer && wget https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip && unzip *.zip

# RUN ln -s /packer/packer /usr/local/bin/packer

RUN wget http://www.gecode.org/download/gecode-3.7.3.tar.gz && tar -xvf gecode-3.7.3.tar.gz

RUN cd gecode-3.7.3 && ./configure && make && make install

RUN locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
