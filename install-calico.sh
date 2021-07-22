#!/usr/bin/env bash
curl https://docs.projectcalico.org/manifests/calico.yaml -O

sed -i 's/# - name: CALICO_IPV4POOL_CIDR/- name: CALICO_IPV4POOL_CIDR/g' calico.yaml
sed -i 's/#   value: "192.168.0.0\/16"/  value: "192.168.0.0\/20"/g' calico.yaml

cat calico.yaml | grep CALICO_IPV4POOL_CIDR -A1

kubectl apply -f ./calico.yaml
