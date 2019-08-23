FROM centos:7

RUN yum install -y epel-release systemd logrotate cronie procps util-linux sudo
RUN yum install -y python2-pip
RUN pip install ansible==2.7.10

ENV ANSIBLE_RETRY_FILES_ENABLED=False
ENV AWS_DEFAULT_REGION=ap-northeast-1

ENTRYPOINT [ "/sbin/init" ]
