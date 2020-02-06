# petercameron/ubuntu-openjdk-mysql
FROM ubuntu:16.04

LABEL maintainer=peter.cameron@mesosys.com

ENV DEBIAN_FRONTEND noninteractive

# Update apt-get
RUN apt-get -qq update

# install mysql with root/root
RUN echo "mysql-server-5.7 mysql-server/root_password password root" | debconf-set-selections
RUN echo "mysql-server-5.7 mysql-server/root_password_again password root" | debconf-set-selections

# This doesn't work in docker ...
#RUN echo "mysql-server-5.7 mysql-server-5.7/start_on_boot boolean true" | debconf-set-selections

## install openjdk & my-sql
RUN apt-get -y --no-install-recommends install mysql-server-5.7 openjdk-8-jdk

#Expose 3306 if external diagnosis of MySQL is required
EXPOSE 3306

CMD ["bash"]
