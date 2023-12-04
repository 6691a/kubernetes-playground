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

클라우드 (GCP):
> ❗️ 요금이 부과되므로 주의하세요.
- secret 폴더에 인증 정보를 gcp_credential.json 파일로 만들어 넣어주세요.

명령어를 실행하여 GKE를 생성하세요.
```sh
# terraform/gcp
terraform init && terraform apply -auto-approve
```

Hypervisor(Proxmox):
- secret 폴더에 인증 정보를 proxmox_credential.json 파일로 만들어 넣어주세요.
```
# sample
{
    "api_url": "",
    "node": "",
    "api_token_id": "",
    "api_token_secret": "",
    "ssh": ""
    # 0번은 primary의 ip로 사용됩니다.
    "network": [
        {
            "name": "eth0",
            "bridge": "vmbr0",
            "gateway": "192.168.88.1",  
            "ip": "192.168.88.50/24"
        },
        ...
    ]
}
```

명령어를 실행하여 VM을 생성하세요.

```sh
# terraform/proxmox
terraform init && terraform apply -auto-approve
```

Ansible의 inventry의 값을 넣어주세요.

```sh
# ansible/inventory.yaml
all:
  vars:
    ansible_user: root
    ansible_ssh_private_key_file: your_pem_key

  children:
    primary:
      hosts:
        ip or dns

    nodes:
      hosts:
        ip or dns
```


<!-- Markdown link & img dfn's -->
[tf-badge]: https://img.shields.io/badge/terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white
[k8s-badge]: https://img.shields.io/badge/kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white
[ab-badge]: https://img.shields.io/badge/ansible-000000?style=for-the-badge&logo=ansible&logoColor=white
[pm-badge]: https://img.shields.io/badge/proxmox-E57000?style=for-the-badge&logo=proxmox&logoColor=white
[gcp-badge]: https://img.shields.io/badge/googlecloud-4285F4?style=for-the-badge&logo=googlecloud&logoColor=white
[k8s-img]: ./img/k8s.png
