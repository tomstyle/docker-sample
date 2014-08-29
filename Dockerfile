FROM centos
MAINTAINER Takayuki Tomiyama <tomiyama@gmail.com>

# RUN: buildするときに実行される

#RUN echo "now buidlding"

#CMD: runするときに実行される
#CMD: "now running…" nekodd
#CMD ["echo", "now running"]

RUN yum update -y
RUN yum install -y openssh-server httpd php php-mbstring mysql-server php-mysql python-setuptools
RUN yum clean all
RUN easy_install supervisor