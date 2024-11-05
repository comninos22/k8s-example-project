
# rollout 

kubectl rollout restart deployment.apps/client-api


# apply

./scripts/apply_k8s.sh


# enable metrics 

kubectl create -f https://raw.githubusercontent.com/pythianarora/total-practice/master/sample-kubernetes-code/metrics-server.yaml

# add local domain

open notepad as admin -> open C:/Windows/System32/drivers/etc/hosts.bak -> local.net 127.0.0.1 -> save