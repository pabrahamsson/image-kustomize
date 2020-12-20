FROM registry.access.redhat.com/ubi8/ubi-minimal

ARG KUSTOMIZE_VERSION=v3.8.8

RUN microdnf install tar gzip && \
    curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | tar zxvf - -C /usr/local/bin kustomize

USER 1001

ENTRYPOINT ["kustomize"]
CMD ["version"]
