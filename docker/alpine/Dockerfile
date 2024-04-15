FROM alpine:latest
WORKDIR /coremark
COPY coremark.sh .
RUN chmod +x coremark.sh
ENTRYPOINT ["/bin/ash", "coremark.sh"]
