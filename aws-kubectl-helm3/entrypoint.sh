#!/bin/sh
set -e

aws configure set default.region ${CLUSTER_REGION}
aws eks update-kubeconfig --name ${CLUSTER_NAME_ISTIO}

helm init -c
helm repo add mryum https://raw.githubusercontent.com/mr-yum/charts/master/
helm repo add apmryum https://raw.githubusercontent.com/andreipetrescu95/charts/master/

exec "$@"
