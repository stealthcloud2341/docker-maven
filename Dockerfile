FROM maven:3.3.9-jdk-8

RUN apt-get -y update
RUN apt-get install -y --fix-missing curl build-essential g++ unzip wget git zip libgmp-dev ruby-dev

RUN git config --global http.sslVerify false
RUN command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN \curl -L https://get.rvm.io | bash -s stable

RUN /bin/bash -l -c "rvm install 2.2.3"
RUN /bin/bash -l -c "gem install bundler"
RUN /bin/bash -l -c "gem install test-kitchen"
RUN /bin/bash -l -c "gem install chef"
RUN /bin/bash -l -c "gem install chef-dk"
RUN /bin/bash -l -c "gem install chef-provisioning-vsphere"

RUN wget http://www.gecode.org/download/gecode-3.7.3.tar.gz && tar -xvf gecode-3.7.3.tar.gz

RUN cd gecode-3.7.3 && ./configure && make && make install

COPY settings.xml $MAVEN_CONFIG
COPY pom.xml  /tmp

RUN cd /tmp && mvn compile

# RUN locale-gen "en_US.UTF-8"

# ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
