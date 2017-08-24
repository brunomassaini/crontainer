FROM ubuntu:16.04

ENV LC_ALL "C.UTF-8"
ENV LANG "C.UTF-8"
ENV PATH "/usr/local/bin:/root/.local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/aws/bin"

RUN apt-get update && apt-get install cron python3 curl supervisor -y
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py --user
RUN pip install awscli --upgrade --user

ADD scripts /scripts

WORKDIR /
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.7.2/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
RUN mkdir /var/log/scripts
RUN mkdir /var/log/supervisord

ADD crontab /etc/cron.d/crons
RUN chmod 0644 /etc/cron.d/crons
COPY ./entrypoint.sh /entrypoint.sh

CMD /entrypoint.sh && supervisord -n -c /scripts/tools/supervisor.conf
