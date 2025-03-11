#!/bin/bash

# Setup arg
ARGOCD_SERVER="${ARGOCD_SERVER}"
ARGOCD_USERNAME="${ARGOCD_USERNAME}"
ARGOCD_PASSWORD="${ARGOCD_PASSWORD}"
APP_NAME="my-app"
GIT_REPO="https://github.com/Puun2545/Pipeline-Test-Interview.git"
APP_PATH="k8s/"
DEST_NAMESPACE="default"
DEST_SERVER="https://kubernetes.default.svc"

# Login
argocd login "${ARGOCD_SERVER}" --username "${ARGOCD_USERNAME}" --password "${ARGOCD_PASSWORD}" --insecure

# Check if App Already Existed
if argocd app get "${APP_NAME}" > /dev/null 2>&1; then
    echo "Application ${APP_NAME} already exists. Syncing..."
    argocd app sync "${APP_NAME}"
else
    echo "Application ${APP_NAME} not found. Creating..."
    argocd app create "${APP_NAME}" \
        --repo "${GIT_REPO}" \
        --path "${APP_PATH}" \
        --dest-server "${DEST_SERVER}" \
        --dest-namespace "${DEST_NAMESPACE}" \
        --sync-policy automated
fi
