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
- secret 폴더에 인증 정보를 gcp_credential.json 파일로 만들어 넣어주세요.

명령어를 실행하여 GKE를 생성하세요.
```sh
# terraform/gcp
terraform init && terraform apply -auto-approve
```
</details>


### Hypervisor:
<details>
<summary>Proxmox</summary>

- ```secret/sample``` 폴더에 필요한 파일을 복사하여 ```secret/``` 폴더 아래 이동 후 입력해주세요. 


</details>

<!-- Markdown link & img dfn's -->
[tf-badge]: https://img.shields.io/badge/terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white
[k8s-badge]: https://img.shields.io/badge/kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white
[ab-badge]: https://img.shields.io/badge/ansible-000000?style=for-the-badge&logo=ansible&logoColor=white
[pm-badge]: https://img.shields.io/badge/proxmox-E57000?style=for-the-badge&logo=proxmox&logoColor=white
[gcp-badge]: https://img.shields.io/badge/googlecloud-4285F4?style=for-the-badge&logo=googlecloud&logoColor=white
