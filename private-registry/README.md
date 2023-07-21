# 사설 레지스트리 서비스 구축하기

## 인프라 구성

4대의 가상 머신을 사용한다.

- VirtualBox VM
  - CPU 2
  - RAM 2048MB
- Ubuntu 20.04

- nexus
  레지스트리 읽기 노드 (Nexus3)
  192.168.35.100

  * 8081 - 콘솔
  * 5000 - 레지스트리 게이트웨이

- service
  서비스 노드
  192.168.35.101

  * 8080: Django 웹 서버

- minio
  오브젝트 스토리지 노드 (Minio)
  192.168.35.102

  * 9000: 데이터 전송
  * 9001: 콘솔

- habor
  레지스트리 쓰기 노드 (Habor)
  192.168.35.103

  * 80: 443 리다이렉션
  * 443: HTTPS

### 네트워크
- 기본 NAT
- internal network

## 실행

```bash
VAGRANT_EXPERIMENTAL="disks" vagrant up # disk 프로비저닝은 아직 실험 단계임에 유의한다.
```