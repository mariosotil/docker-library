FROM alpine:3.4

MAINTAINER mariosotil <mario.sotil@gmail.com>

# IMPORTANT: make it work with user docker

RUN apk update \
    && apk upgrade \
    && apk add docker git bash \
    && rm -rf /var/cache/apk/*

#RUN adduser -s /bin/bash -G docker -D docker 

#ENV HOME /home/docker
#WORKDIR /home/docker
WORKDIR /root

COPY build.sh .
#RUN chown docker:docker build.sh
RUN chmod u+x build.sh

#USER docker

#CMD /bin/bash /root/build.sh
CMD ["/bin/bash"]
