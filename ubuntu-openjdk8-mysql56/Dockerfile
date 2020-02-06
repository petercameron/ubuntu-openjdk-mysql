# petercameron/ubuntu-openjdk-mysql
FROM ubuntu:16.04

LABEL maintainer=peter.cameron@mesosys.com

ENV DEBIAN_FRONTEND noninteractive
ENV MYSQL_MAJOR 5.6
ENV MYSQL_VERSION 5.6.47-1debian9


# Attempting to access archived version of MySQL (5.6) ...
#RUN apt-get install -y software-properties-common
#RUN add-apt-repository 'deb http://archive.ubuntu.com/ubuntu trusty universe'
# ... settling on Percona 5.6
RUN echo "deb http://repo.mysql.com/apt/debian/ stretch mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list

# Update apt-get repository list
RUN apt-get -qq update

# install mysql with root/root
#RUN echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
#RUN echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
#RUN echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections
#RUN echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections
#RUN echo "percona-server-server-5.6 mysql-server/root_password password root" | debconf-set-selections
#RUN echo "percona-server-server-5.6 mysql-server/root_password_again password root" | debconf-set-selections
RUN echo "mysql-community-server mysql-community-server/root-pass password root" | debconf-set-selections
RUN echo "mysql-community-server mysql-community-server/re-root-pass password root" | debconf-set-selections

## install openjdk & my-sql 5.6 (percona 5.6)
RUN apt-get -y --allow-unauthenticated install \
    mysql-client="${MYSQL_VERSION}" \
    mysql-community-server="${MYSQL_VERSION}" \
    openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

#    mysql-server="${MYSQL_VERSION}" \

#Expose 3306 if external diagnosis of MySQL is required
EXPOSE 3306

CMD ["bash"]
