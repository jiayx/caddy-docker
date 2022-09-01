FROM caddy:2.5.2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/imgk/caddy-trojan \
    --with github.com/mholt/caddy-l4/layer4

FROM caddy:2.5.2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
