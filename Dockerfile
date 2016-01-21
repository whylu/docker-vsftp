FROM centos:6.6

ENV CUSTOMIZED_CONFIG=/opt/customizedFtpConfig

ADD ./ftp-setup.sh /tmp/ftp-setup.sh
RUN chmod +x /tmp/ftp-setup.sh
CMD /tmp/ftp-setup.sh

EXPOSE 21 65400-65410

