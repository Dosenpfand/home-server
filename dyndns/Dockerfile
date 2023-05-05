FROM alpine

ENV DYNDNS_VERSION 1.2

RUN apk add bind-tools jq gawk curl --no-cache 
RUN curl -L https://github.com/FarrowStrange/hetzner-api-dyndns/releases/download/v${DYNDNS_VERSION}/dyndns.sh --output /dyndns.sh
RUN chmod +x /dyndns.sh

COPY cron.sh /cron.sh
RUN chmod +x /cron.sh
RUN rm /var/spool/cron/crontabs/root
RUN echo '*/5 * * * * ash /dyndns.sh' > /var/spool/cron/crontabs/root

ENTRYPOINT [ "/cron.sh" ]
