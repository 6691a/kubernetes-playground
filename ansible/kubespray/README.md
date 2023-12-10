> 💬 v2.23.1  
https://github.com/kubernetes-sigs/kubespray

1. sample파일 복사하여 k8s 설정값 수정하기
> 📢 group_vars를 통해 설정을 수정할 수 있습니다.
```
# /ansible/kubespray
cp -r inventory/sample inventory/your_folder_name  
```

2. 실행하기
```
ansible-playbook -i inventory/your_folder_name/inventory.ini -b cluster.yml
```