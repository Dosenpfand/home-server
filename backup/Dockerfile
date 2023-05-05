FROM alpine

RUN apk add restic --no-cache 

COPY backup.sh /backup.sh
RUN chmod +x /backup.sh

COPY cron.sh /cron.sh
RUN chmod +x /cron.sh
RUN rm /var/spool/cron/crontabs/root
RUN echo '0 3 * * * ash /backup.sh' > /var/spool/cron/crontabs/root

ENTRYPOINT [ "/cron.sh" ]
