FROM alpine:3.20
WORKDIR /coremark
COPY coremark.sh .
RUN chmod +x coremark.sh
ENTRYPOINT ["/bin/sh", "coremark.sh"]
