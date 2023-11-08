ARG UPSTREAM_VERSION
FROM nethermind/nethermind:${UPSTREAM_VERSION}

COPY /security /security
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apt update && apt install -y curl || true

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]

