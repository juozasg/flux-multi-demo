brew install helm vcluster clusterctrl
kind create cluster --name multi-control
clusterctl init --infrastructure vcluster
export CLUSTER_NAME=cluster-01
export CLUSTER_NAMESPACE=vcluster-${CLUSTER_NAME}
export KUBERNETES_VERSION=1.25.0
export HELM_VALUES=""
kubectl create namespace ${CLUSTER_NAMESPACE}
clusterctl generate cluster ${CLUSTER_NAME} \
    --infrastructure vcluster \
    --target-namespace ${CLUSTER_NAMESPACE}










# apiVersion: cluster.x-k8s.io/v1beta1
# kind: Cluster
# metadata:
#   name: cluster-02
#   namespace: cluster-02
# spec:
#   controlPlaneRef:
#     apiVersion: infrastructure.cluster.x-k8s.io/v1alpha1
#     kind: VCluster
#     name: cluster-02
#   infrastructureRef:
#     apiVersion: infrastructure.cluster.x-k8s.io/v1alpha1
#     kind: VCluster
#     name: cluster-02
# ---
# apiVersion: infrastructure.cluster.x-k8s.io/v1alpha1
# kind: VCluster
# metadata:
#   name: cluster-02
#   namespace: cluster-02
# spec:
#   controlPlaneEndpoint:
#     host: ""
#     port: 0
#   helmRelease:
#     chart:
#       name: null
#       repo: null
#       version: null
#     values: ""
#   kubernetesVersion: 1.24.0