FROM alpine:latest

RUN apk add --no-cache tzdata curl dcron

# create dir for logging
RUN mkdir /var/log/monitoring

WORKDIR /monitoring

COPY monitoring.sh .
RUN chmod +x monitoring.sh

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

CMD ["/monitoring/entrypoint.sh", ""]