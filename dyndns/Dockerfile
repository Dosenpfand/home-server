FROM alpine
RUN apk add --no-cache bash curl
ENV API_TOKEN="" \
    ZONE_NAME="" \
    RECORD_NAME="" \
    INTERVAL=120
COPY dyndns.sh /dyndns.sh
RUN chmod +x /dyndns.sh
CMD ["bash", "/dyndns.sh"]
