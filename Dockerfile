FROM alpine:latest

RUN apk add --no-cache ssmtp
RUN apk add --no-cache dcron

COPY ssmtp.conf /etc/ssmtp/ssmtp.conf

RUN sed -i "s/myMailhub/$SMTPSERVER/g" /etc/ssmtp/ssmtp.conf
RUN sed -i "s/UseSTARTTLS=YES/UseSTARTTLS=$UseSTARTTLS/g" /etc/ssmtp/ssmtp.conf

RUN echo root:$FROM:$SMTPSERVER >> /etc/ssmtp/revaliases


#COPY monitoring.sh .

#RUN chmod +x monitoring.sh

#RUN echo "*/10 * * * * monitoring monitoring.sh 192.168.20.10 > monitoring.log" > /etc/crontabs/monitoring

COPY message.txt .

COPY testing.sh .
RUN chmod +x testing.sh

CMD ["./testing.sh", ""]