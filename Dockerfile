FROM centos
MAINTAINER Takayuki Tomiyama <tomiyama@gmail.com>
ENV IP 54.64.104.214
ENV PW s4610201

RUN useradd beat
RUN passwd -f -u beat
RUN mkdir -p /home/beat/.ssh;chown beat /home/beat/.ssh;chmod 700 /home/beat/.ssh
ADD ./authorized_keys /home/beat/.ssh/authorized_keys
RUN chown beat /home/beat/.ssh/authorized_keys;chmod 600 /home/beat/.ssh/authorized_keys

RUN echo "beat ALL=(ALL) ALL" >> /etc/sudoers.d/beat

#ADD ./sshd_config /etc/ssh/sshd_config
RUN sed -ri "s/^UsePAM yes/#UsePAM yes/" /etc/ssh/sshd_config
RUN sed -ri "s/^#UsePAM no/UsePAM no/" /etc/ssh/sshd_config
RUN /etc/init.d/sshd start;/etc/init.d/sshd stop

EXPOSE 80 22

ENTRYPOINT /etc/init.d/httpd start && /etc/init.d/sshd start && /bin/bash