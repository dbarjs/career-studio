ARG VARIANT=20-bookworm
FROM mcr.microsoft.com/devcontainers/javascript-node:1-${VARIANT}

# Install node modules as node user
ARG NODE_MODULES="@antfu/ni @devcontainers/cli spaceship-prompt"
RUN su node -c "umask 0002 && npm install -g ${NODE_MODULES}" \
    && npm cache clean --force > /dev/null 2>&1

ARG USERNAME=node

# Execute scripts
RUN mkdir -p /tmp/scripts
COPY scripts /tmp/scripts
RUN chmod -R +x /tmp/scripts \
    && /bin/bash -c /tmp/scripts/install.sh $USERNAME \
    && rm -rf /tmp/scripts
