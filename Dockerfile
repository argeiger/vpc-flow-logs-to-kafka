FROM logstash:8.9.2

RUN /usr/share/logstash/bin/logstash-plugin remove logstash-integration-aws && \
    /usr/share/logstash/bin/logstash-plugin install logstash-input-s3-cos 

COPY logstash.conf /usr/share/logstash/pipeline/logstash.conf

ENTRYPOINT ["/usr/share/logstash/bin/logstash"]