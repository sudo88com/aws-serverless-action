# syntax=docker/dockerfile:1

# renovate: datasource=docker depName=node
ARG NODE_VERSION=20.15.0

FROM node:${NODE_VERSION}-alpine AS build

FROM build

WORKDIR /app

RUN npm install -g serverless

# Clear and enable Alpine caching
RUN mkdir -p /var/cache/apk \
    && ln -s /var/cache/apk /etc/apk/cache \
    && rm -rf /var/cache/apk/*

USER root
