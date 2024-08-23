FROM node:16-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git

COPY scripts /scripts

WORKDIR /nextstrain/auspice

RUN /scripts/download-repo https://github.com/BCCDC-PHL/auspice release . \
    && npm install --omit dev . && npm link

ENV HOST=0.0.0.0

EXPOSE 4000

ENTRYPOINT ["auspice", "view", "--datasetDir", "/nextstrain/auspice/datasets", "--narrativeDir", "/nextstrain/auspice/narratives"]
