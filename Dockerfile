# Version. Can change in build progress
ARG GCLOUD_SDK_VERSION=438.0.0-alpine

# Use google cloud sdk
FROM google/cloud-sdk:$GCLOUD_SDK_VERSION
MAINTAINER Singularities

# Install Java 11 for Pub/Sub emulator
RUN apk --update add openjdk11-jre
RUN gcloud components install pubsub-emulator beta --quiet

# Volume to persist Pub/Sub data
VOLUME /opt/data

COPY start-pubsub .

EXPOSE 8432

ENTRYPOINT ["./start-pubsub"]