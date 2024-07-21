FROM alpine:latest

RUN apk add --no-cache tzdata ssmtp dcron

COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

# create dir for logging
RUN mkdir /var/log/monitoring
RUN mkdir -p /monitoring/tmp

WORKDIR /monitoring

COPY monitoring.sh .
RUN chmod +x monitoring.sh

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

CMD ["/monitoring/entrypoint.sh", ""]