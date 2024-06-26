FROM caddy:2-builder AS builder

LABEL org.opencontainers.image.title=authp
LABEL org.opencontainers.image.description="Authentication Portal"
LABEL org.opencontainers.image.url=https://github.com/greenpau/caddy-security
LABEL org.opencontainers.image.source=https://github.com/greenpau/caddy-security
LABEL org.opencontainers.image.version=1.1.29
LABEL maintainer="greenpau"

RUN xcaddy build \
    --with github.com/greenpau/caddy-security@latest \
    --with github.com/greenpau/caddy-security-secrets-aws-secrets-manager@latest \
    --with github.com/greenpau/caddy-trace@latest \
    --with github.com/caddy-dns/namecheap

FROM caddy:2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
