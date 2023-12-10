# Playground-Kubernetes
> 학습을 진행하며, 여러 테스트를 진행하는 Kubernetes 놀이터

![Kubernetes][k8s-badge]
![Terraform][tf-badge]
![Ansible][ab-badge]
![GCP][gcp-badge]
![Proxmox][pm-badge]

VM 혹은 클라우드에 쿠버네티스 환경을 구축하고 배우는 공간

<!-- ![k8s-img][k8s-img] -->

## 설치 방법

### Cloud:
<details>
<summary>GCP</summary>

> ❗️ 요금이 부과되므로 주의하세요.

1. gcp_credential.json 파일 작성하기.
```
# /kubernetes
cp -r secret/sample/* secret/
```

명령어를 실행하여 GKE를 생성하세요.
```
# kubernetes/terraform/gcp
terraform init && terraform apply -auto-approve
```
</details>


### Hypervisor:
<details>
<summary>Proxmox</summary>

> ❗️ Linux Container에서는 KubeSpary를 사용하여 K8S 설치가 불가능 합니다.

### Setup VM
1. proxmox_credential.json 파일 작성하기.
```
# /kubernetes
cp -r secret/sample/* secret/
```

2. Clone에 필요한 이미지 만들기
- https://devopstales.github.io/home/proxmox-terraform/ 
```
# /kubernetes/terraform/proxmox
terraform init && terraform apply -auto-approve
```
---
### Setup K8S
- [KubeSpary]를 통해 Kubernetes 구축하기
- [k8s-hard-way] 직접 구축하기

</details>

<!-- Markdown link & img dfn's -->
[tf-badge]: https://img.shields.io/badge/terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white
[k8s-badge]: https://img.shields.io/badge/kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white
[ab-badge]: https://img.shields.io/badge/ansible-000000?style=for-the-badge&logo=ansible&logoColor=white
[pm-badge]: https://img.shields.io/badge/proxmox-E57000?style=for-the-badge&logo=proxmox&logoColor=white
[gcp-badge]: https://img.shields.io/badge/googlecloud-4285F4?style=for-the-badge&logo=googlecloud&logoColor=white


[KubeSpary]: ansible/kubespray/README.md

[k8s-hard-way]: https://github.com/kelseyhightower/kubernetes-the-hard-way