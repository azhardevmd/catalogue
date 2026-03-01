# Catalogue Microservice

Node.js-based **Catalogue Microservice** designed for cloud-native deployment with Docker, CI/CD automation, and integrated security scanning.

This service is part of a microservices architecture and includes:

- 🐳 Dockerized build  
- 🔁 Jenkins + GitHub Actions CI/CD  
- 🔍 SonarQube code quality analysis  
- 🔐 Trivy container security scanning  
- 📦 Amazon ECR image publishing  
- 🤖 Dependabot dependency updates  
- ☸️ Kubernetes-ready deployment  

---

## 🚀 Tech Stack

- Node.js  
- Docker  
- Jenkins  
- GitHub Actions (Reusable Workflows)  
- SonarQube  
- Trivy  
- AWS ECR  
- Kubernetes  

---

## 📂 Project Structure
catalogue/
│── .github/workflows/ # GitHub Actions workflows
│── db/ # Database related files
│── Dockerfile # Container build definition
│── Jenkinsfile # Jenkins pipeline
│── server.js # Application entry point
│── package.json # Node dependencies
│── sonar-project.properties # SonarQube config
│── .security-baseline.json # Security baseline config

---

### Install dependencies
```bash
npm install
```
### Docker Build
```bash
docker build -t catalogue-service . 
```

## 🔁 CI/CD Pipeline

This repository uses:

- Reusable GitHub Actions workflow
- Jenkins Shared Library
- Automated Docker image build
- SonarQube code scan
- Trivy security scan
- Push to Amazon ECR

### Pipeline Flow

1. Code pushed to **feature/main** branch  
2. GitHub Actions triggers reusable workflow  
3. SonarQube analysis runs  
4. Docker image builds  
5. Trivy scans image  
6. Image pushed to ECR  
7. Deployment triggered (if configured)  

##  Branch Strategy

- **main** → Production-ready code  
- **feature/*** → Feature development branches  

Reusable workflow handles feature-based deployments.