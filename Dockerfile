FROM maven:3.3.9-jdk-8

RUN apt-get -y update
RUN apt-get install -y --fix-missing curl build-essential g++ unzip wget git zip libgmp-dev ruby-dev

RUN git config --global http.sslVerify false
RUN command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
RUN \curl -L https://get.rvm.io | bash -s stable

RUN /bin/bash -l -c "rvm install 2.2.3"
RUN /bin/bash -l -c "gem install bundler"
COPY Gemfile  /tmp
RUN cd /tmp && /bin/bash -l -c "bundle install"

RUN wget http://www.gecode.org/download/gecode-3.7.3.tar.gz && tar -xvf gecode-3.7.3.tar.gz

RUN cd gecode-3.7.3 && ./configure && make && make install

COPY settings.xml $MAVEN_CONFIG

# Need multiple pom files to handle multiple versions of same jar
COPY pom.xml  /tmp
RUN cd /tmp && mvn compile

RUN mkdir /tmp/pom2
COPY pom2.xml  /tmp/pom2
RUN mv /tmp/pom2/pom2.xml /tmp/pom2/pom.xml
RUN cd /tmp/pom2 && mvn compile

RUN mkdir /tmp/pom3
COPY pom3.xml  /tmp/pom3
RUN mv /tmp/pom3/pom3.xml /tmp/pom3/pom.xml
RUN cd /tmp/pom3 && mvn compile

RUN mkdir /tmp/pom4
COPY pom4.xml  /tmp/pom4
RUN mv /tmp/pom4/pom4.xml /tmp/pom4/pom.xml
RUN cd /tmp/pom4 && mvn compile

RUN mkdir /tmp/pom5
COPY pom5.xml  /tmp/pom5
RUN mv /tmp/pom5/pom5.xml /tmp/pom5/pom.xml
RUN cd /tmp/pom5 && mvn compile

RUN mkdir /tmp/pom6
COPY pom6.xml  /tmp/pom6
RUN mv /tmp/pom6/pom6.xml /tmp/pom6/pom.xml
RUN cd /tmp/pom6 && mvn compile

RUN mkdir /tmp/pom7
COPY pom7.xml  /tmp/pom7
RUN mv /tmp/pom7/pom7.xml /tmp/pom7/pom.xml
RUN cd /tmp/pom7 && mvn compile

RUN mkdir /tmp/pom8
COPY pom8.xml  /tmp/pom8
RUN mv /tmp/pom8/pom8.xml /tmp/pom8/pom.xml
RUN cd /tmp/pom8 && mvn compile

RUN mkdir /tmp/pom9
COPY pom9.xml  /tmp/pom9
RUN mv /tmp/pom9/pom9.xml /tmp/pom9/pom.xml
RUN cd /tmp/pom9 && mvn compile

RUN mkdir /tmp/pom10
COPY pom10.xml  /tmp/pom10
RUN mv /tmp/pom10/pom10.xml /tmp/pom10/pom.xml
RUN cd /tmp/pom10 && mvn compile

# RUN locale-gen "en_US.UTF-8"

# ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8
