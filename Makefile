FLINK_OPERATOR_VERSION=1.9.0

setup_certs:
	kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v1.9.1/cert-manager.crds.yaml
	helm repo add jetstack https://charts.jetstack.io
	helm install cert-manager jetstack/cert-manager --namespace cert-manager --create-namespace --version v1.9.1 --debug

setup_flink:
	helm repo add flink-operator-repo https://downloads.apache.org/flink/flink-kubernetes-operator-$(FLINK_OPERATOR_VERSION)/
	helm install flink-kubernetes-operator flink-operator-repo/flink-kubernetes-operator --namespace flink --create-namespace

helm_dep:
	cd k8s/templates/ && helm dependency build