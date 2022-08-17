FROM alpine:latest

COPY installer.sh /installer.sh
COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache git curl

RUN chmod +x /installer.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]