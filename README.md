# 🛍️ Retail Store v2 - Production Platform Engineering on AWS

Retail Store v2 is a production-grade cloud-native microservices platform built on Amazon EKS following modern Platform Engineering and GitOps best practices.

---
# Microservices

The application consists of five independently deployable microservices.

The architecture follows a polyglot microservices approach where each service owns its own datastore, allowing independent scaling, deployment, and lifecycle management.

| Service             | Language/Framework | Purpose                           | AWS Backend                        |
| ------------------- | ------------------ | --------------------------------- | ---------------------------------- |
| 🌐 **UI**           | Spring Boot        | Customer-facing retail storefront | —                                  |
| 📦 **Catalog**      | Go                 | Product catalog and inventory     | Amazon RDS MySQL                   |
| 🛒 **Carts**        | Spring Boot        | Shopping cart management          | Amazon DynamoDB                    |
| 💳 **Checkout**     | Node.js            | Checkout workflow                 | Amazon ElastiCache Redis           |
| 📑 **Orders**       | Spring Boot        | Order processing and fulfillment  | Amazon RDS PostgreSQL + Amazon SQS |

# Repository Structure

```text
retail-store-v2-platform/
│
├── applications/
│   ├── ui/
│   ├── catalog/
│   ├── carts/
│   ├── checkout/
│   ├── orders/
│
├── docker/
│
├── terraform/
│
├── observability/
│
├── docs/
├── scripts/
│
├── README.md
└── LICENSE
└── .github/
```

# Architecture

```
                    GitHub
                       │
          GitHub Actions CI/CD
                       │
              Amazon ECR Images
                       │
                  ArgoCD GitOps
                       │
              Amazon EKS Cluster
                       │
 ┌──────────────────────────────────────────────┐
 │                                              │
 │   UI                                         │
 │   Catalog                                    │
 │   Carts                                      │
 │   Orders                                     │
 │   Checkout                                   │
 │   Notification                               │
 │                                              │
 └──────────────────────────────────────────────┘
                       │
         AWS Managed Services
       ┌──────────────────────────┐
       │ RDS MySQL                │
       │ RDS PostgreSQL           │
       │ DynamoDB                 │
       │ ElastiCache Redis        │
       │ Secrets Manager          │
       └──────────────────────────┘
                       │
      OpenTelemetry + ADOT Collectors
                       │
 Amazon Managed Prometheus (AMP)
                       │
 Amazon Managed Grafana (AMG)
```

---

# Technology Stack

## Cloud

- AWS
- Amazon EKS
- Amazon ECR
- Amazon RDS
- DynamoDB
- ElastiCache Redis
- Amazon Managed Prometheus
- Amazon Managed Grafana
- AWS Secrets Manager
- AWS IAM
- AWS Pod Identity
- Route53
- ACM

---

## Infrastructure as Code

- Terraform
- Modular Terraform
- Remote State (S3)
- DynamoDB State Locking

---

## Kubernetes

- Deployments
- Services
- ConfigMaps
- Secrets
- ServiceAccounts
- Pod Identity
- Horizontal Pod Autoscaler
- Pod Disruption Budgets
- Topology Spread Constraints
- Security Contexts
- Readiness Probes
- Startup Probes
- Liveness Probes

---

## GitOps

- Helm
- ArgoCD
- Argo Rollouts
- Canary Deployments
- Blue/Green Deployments

---

## CI/CD

- GitHub Actions
- Docker
- Amazon ECR

---

## Observability

- OpenTelemetry
- AWS Distro for OpenTelemetry (ADOT)
- Amazon Managed Prometheus
- Amazon Managed Grafana
- Prometheus Metrics
- Distributed Tracing

---

## Security

- AWS Pod Identity
- Secrets Store CSI Driver
- AWS Secrets Manager
- Read-only Root Filesystem
- Non-root Containers
- Linux Capabilities Dropped
- RuntimeDefault Seccomp

---

# Features

- Production-grade EKS Platform
- Infrastructure as Code with Terraform
- GitOps with ArgoCD
- Progressive Delivery using Argo Rollouts
- Helm-based Kubernetes Deployments
- Secure Secrets Management
- AWS Pod Identity
- Horizontal Pod Autoscaling
- Karpenter Node Autoscaling
- Application Health Probes
- Pod Disruption Budgets
- Topology Spread Constraints
- OpenTelemetry Instrumentation
- Amazon Managed Prometheus
- Amazon Managed Grafana
- GitHub Actions CI/CD

---

# Platform Improvements (v2)

Retail Store v2 modernizes the original project by introducing several production-grade improvements.

## Security

- Read-only root filesystem
- Non-root containers
- RuntimeDefault Seccomp
- Dropped Linux capabilities

## Reliability

- Startup Probes
- Readiness Probes
- Liveness Probes
- Pod Disruption Budgets

## Scalability

- Horizontal Pod Autoscaler
- Karpenter
- Topology Spread Constraints

## GitOps

- ArgoCD
- Declarative deployments
- Git-driven infrastructure

## Progressive Delivery

- Canary Deployments
- Blue/Green Deployments
- Automated Rollbacks
- Analysis Templates

## Observability

- OpenTelemetry
- Amazon Managed Prometheus
- Amazon Managed Grafana
- Distributed Tracing
- Centralized Metrics

---

# CI/CD Pipeline

```
Developer
      │
      ▼
GitHub Push
      │
      ▼
GitHub Actions
      │
      ▼
Docker Build
      │
      ▼
Amazon ECR
      │
      ▼
GitOps Repository
      │
      ▼
ArgoCD Sync
      │
      ▼
Amazon EKS
```

---

# Project Goals

- Build a production-ready Kubernetes platform
- Demonstrate modern GitOps workflows
- Implement progressive delivery
- Secure workloads using AWS Pod Identity
- Centralize observability using OpenTelemetry
- Automate deployments using GitHub Actions
- Follow Platform Engineering best practices

---

# Future Enhancements

- Chaos Engineering
- Kyverno Policies
- Gatekeeper
- Argo Events
- Crossplane
- Multi-Cluster GitOps
- Service Mesh (Istio)
- FinOps Dashboards
- eBPF Observability
