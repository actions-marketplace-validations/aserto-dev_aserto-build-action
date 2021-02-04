FROM ghcr.io/aserto-dev/aserto-one:latest
COPY /entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
