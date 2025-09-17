# Wisecow Application

Wisecow is a playful application that prints random messages in ASCII cow art. This project demonstrates Docker containerization, Kubernetes deployment, TLS-secured access, and CI/CD automation using GitHub Actions.

---

## Table of Contents
1. [Project Overview](#project-overview)  
2. [Features](#features)  
3. [Prerequisites](#prerequisites)  
4. [Setup & Installation](#setup--installation)  
5. [Docker Build & Push](#docker-build--push)  
6. [Kubernetes Deployment](#kubernetes-deployment)  
7. [CI/CD Pipeline](#cicd-pipeline)  
8. [TLS / HTTPS Access](#tls--https-access)  
9. [Repository Structure](#repository-structure)  
10. [License](#license)

---

## Project Overview
Wisecow displays fun random quotes using cowsay-style ASCII art. The project demonstrates:

- Containerization with Docker  
- Deployment on Kubernetes  
- Secure HTTPS access using TLS  
- Automated CI/CD via GitHub Actions

---

## Features
- Dockerized application  
- Kubernetes deployment with Deployment, Service, and Ingress  
- TLS-secured HTTPS communication  
- CI/CD automation with GitHub Actions  

---

## Prerequisites
- Docker installed  
- Kubernetes cluster (Minikube, Kind, etc.)  
- `kubectl` configured  
- GitHub account  
- TLS certificate and key (`wisecow.crt` and `wisecow.key`)  

---

## Setup & Installation

1. **Clone the repository**

```bash
git clone https://github.com/shivampandey800/wisecow_task.git
cd wisecow
Deploy Kubernetes manifests

kubectl apply -f wisecow-deployment.yaml
kubectl apply -f wisecow-service.yaml
kubectl apply -f wisecow-ingress.yaml


Verify deployment

kubectl get pods
kubectl get svc
kubectl get ingress


Test service internally

kubectl run -it testpod --image=curlimages/curl -- /bin/sh
curl http://wisecow-service:4499

Docker Build & Push
docker build -t <docker-username>/wisecow:latest .
docker push <docker-username>/wisecow:latest


Add Docker registry secrets (DOCKER_USERNAME and DOCKER_PASSWORD) in GitHub for CI/CD workflow.

Kubernetes Deployment

Deployment: wisecow-deployment.yaml – runs Wisecow pods

Service: wisecow-service.yaml – exposes pods internally on port 4499

Ingress: wisecow-ingress.yaml – external HTTPS access using TLS

Internal port for Wisecow is 4499.

CI/CD Pipeline

GitHub Actions workflow (.github/workflows/docker-ci.yml) automates:

Building Docker image

Pushing Docker image to registry

Optional deployment to Kubernetes

TLS / HTTPS Access

TLS certificate: wisecow.crt

TLS key: wisecow.key

Access via browser:

https://wisecow.local/


If using Minikube locally, add this entry to /etc/hosts:

<minikube-ip> wisecow.local
