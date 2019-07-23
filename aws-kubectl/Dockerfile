FROM alpine:latest
LABEL maintainer="Andrei Miulescu <lusu777@gmail.com>"

ENV KUBECTL_VERSION="v1.15.0"
ENV HELM_VERSION="2.14.2"

RUN apk add --update ca-certificates bash gnupg git jq py-pip \
  && apk add --update -t deps curl gettext \
  && pip install awscli \
  && rm -rf /var/cache/apk/*

ENV BASE_URL="https://get.helm.sh"
ENV TAR_FILE="helm-v${HELM_VERSION}-linux-amd64.tar.gz"

RUN curl -L ${BASE_URL}/${TAR_FILE} |tar xvz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
  & curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.4.0/aws-iam-authenticator_0.4.0_linux_amd64 -o /usr/local/bin/aws-iam-authenticator \
  & wait \
  && chmod +x /usr/local/bin/kubectl \
  && chmod +x /usr/local/bin/aws-iam-authenticator

RUN mkdir -p kube
ADD . .
RUN chmod +x entrypoint.sh
ENV KUBECONFIG=/kube/config
ENTRYPOINT [ "/entrypoint.sh" ]
