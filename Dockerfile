FROM centos
MAINTAINER Takayuki Tomiyama <tomiyama@gmail.com>

# RUN: buildするときに実行される

RUN echo "now buidlding"

#CMD: runするときに実行される
#CMD: "now running…"
CMD ["echo", "now running"]