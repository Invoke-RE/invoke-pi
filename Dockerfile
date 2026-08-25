FROM node:24-bookworm-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends bash ca-certificates git ripgrep python3 python3-pip \
  && python3 -m pip install --break-system-packages pytest
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent
RUN pi install npm:pi-mcp-adapter
RUN pi install npm:pi-web-access
RUN pi update --extensions

WORKDIR /workspace
ENTRYPOINT ["pi"]
