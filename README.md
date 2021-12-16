# AutomateK8

SSH into one of your VM's and run this on the dedicated VM (which will become as master node)
```
curl https://raw.githubusercontent.com/n1g3ld0uglas/AutomateK8/main/master.sh | bash
```

SSH into the other 2 VM's (these will be known as worker nodes)
```
curl https://raw.githubusercontent.com/n1g3ld0uglas/AutomateK8/main/worker.sh | bash
```

### Linking Nodes

After install is complete, you will be prompted to copy a kubeadm ```join``` command from the master node output, and run into on the worker nodes. This win join the 3 nodes (this is the completion of our cluster configuration).<br/>
https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-join/

### Install Calico

Run the below single line command on the master node (only) - this will install Calico for the entire cluster, since they are now joined: <br/>
https://projectcalico.docs.tigera.io/getting-started/kubernetes/self-managed-onprem/onpremises
```
curl https://raw.githubusercontent.com/n1g3ld0uglas/AutomateK8/main/install-calico.sh | bash
```

### Install Calico on a non-kubernetes node:
Not all hosts in your environment run pods/workloads. You may have physical machines or legacy applications that you cannot move into a Kubernetes cluster, but still need to securely communicate with pods in your cluster. Calico Enterprise lets you enforce policy on these non-cluster hosts using the same robust Calico Enterprise network policy that you use for pods. This solution can also be used to protect bare metal/physical servers that run Kubernetes clusters instead of VMs.<br/>
https://docs.tigera.io/v3.11/getting-started/bare-metal/about

![non-cluster-host](https://user-images.githubusercontent.com/82048393/146408905-a5e4c85a-2418-4782-894d-51ca6c83d634.png)


