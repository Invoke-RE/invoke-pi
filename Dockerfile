FROM node:24-bookworm-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends bash ca-certificates git ripgrep python3 python3-pip \
  && python3 -m pip install --break-system-packages pytest
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent
RUN pi install npm:pi-mcp-adapter
RUN pi install npm:pi-web-access
RUN pi update --extensions

# Copy pre-baked extensions into a backup template directory
RUN cp -a /root/.pi /root/.pi-template

# Create entrypoint script inline to sync template data without clobbering host mount files
RUN cat << 'EOF' > /usr/local/bin/docker-entrypoint.sh
#!/usr/bin/env bash
set -e

if [ -d "/root/.pi-template" ]; then
  cp -rn /root/.pi-template/. /root/.pi/ 2>/dev/null || true
fi

exec "$@"
EOF

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["pi"]
