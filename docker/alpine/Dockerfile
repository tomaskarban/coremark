FROM alpine:3.19.1
WORKDIR /coremark
COPY coremark.sh .
RUN chmod +x coremark.sh
ENTRYPOINT ["/bin/ash", "coremark.sh"]
