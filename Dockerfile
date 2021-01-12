FROM qdacity/docker-ci-base:latest
LABEL maintainer="github@qdacity.com"

# Google cloud sdk

RUN \
  curl -o /tmp/google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
  mkdir -p /usr/local/gcloud && \
  tar xf /tmp/google-cloud-sdk.tar.gz -C /usr/local/gcloud/ && \
  /usr/local/gcloud/google-cloud-sdk/install.sh && \
  rm -f /tmp/google-cloud-sdk.tar.gz
  
ENV PATH="/usr/local/gcloud/google-cloud-sdk/bin:${PATH}"

RUN gcloud components install bq core gsutil app-engine-java --quiet

ENV PATH="/usr/local/gcloud/google-cloud-sdk/bin/bq:${PATH}"

