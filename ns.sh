## set the release-name & namespace
export AIRFLOW_NAME="airflow-cluster"
export AIRFLOW_NAMESPACE="airflow-cluster"

## create the namespace
kubectl create ns "$AIRFLOW_NAMESPACE"

## install using helm 3
helm install \
  "$AIRFLOW_NAME" \
  airflow-stable/airflow \
  --namespace "$AIRFLOW_NAMESPACE" \
  --values ./sample-values-CeleryExecutor.yaml
  
## wait until the above command returns and resources become ready 
## (may take a while)
##  --version "8.X.X" \

## kubectl port-forward svc/airflow-cluster-web 8080:8080 --namespace airflow-cluster --address 0.0.0.0