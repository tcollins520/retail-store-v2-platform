# 🛍️ Retail Store v2 – Production Platform Engineering on AWS

Retail Store v2 is a production-grade cloud-native microservices platform built on Amazon EKS to demonstrate modern Platform Engineering practices.

The platform is intentionally developed in progressive milestones, evolving from containerized microservices to a fully observable, GitOps-driven Kubernetes platform implementing production-grade security, scalability, progressive delivery, and cloud-native operational practices.

---

# Engineering Philosophy

Retail Store v2 is intentionally built incrementally to simulate how a real production platform evolves.

Rather than introducing every technology at once, each milestone focuses on mastering a specific layer of the platform—from containerization and Kubernetes fundamentals to Helm, GitOps, progressive delivery, observability, and production operations.

The goal is not simply to deploy software, but to understand the architectural decisions, operational trade-offs, and production best practices behind every implementation.

---

# Project Goals

- Build a production-ready Kubernetes platform on AWS
- Demonstrate modern Platform Engineering practices
- Implement Infrastructure as Code using Terraform
- Deploy workloads to Amazon EKS
- Adopt GitOps with ArgoCD
- Implement Progressive Delivery using Argo Rollouts
- Secure workloads with AWS Pod Identity
- Integrate AWS Secrets Manager
- Build production-ready Helm charts
- Centralize observability using OpenTelemetry
- Automate deployments using GitHub Actions

---

# Microservices

The application consists of five independently deployable microservices.

The platform follows a polyglot microservices architecture where each service owns its own datastore, enabling independent deployment, scaling, and lifecycle management.

| Service | Language | Purpose | AWS Backend |
|----------|----------|----------|-------------|
| 🌐 UI | Spring Boot | Customer-facing storefront | — |
| 📦 Catalog | Go | Product catalog | Amazon RDS MySQL |
| 🛒 Carts | Spring Boot | Shopping cart management | Amazon DynamoDB |
| 💳 Checkout | Node.js | Checkout workflow | Amazon ElastiCache Redis |
| 📑 Orders | Spring Boot | Order processing | Amazon RDS PostgreSQL + Amazon SQS |

---

# Repository Structure

```text
retail-store-v2-platform-engineering/
│
├── applications/                          # Retail Store application source
│   ├── ui/
│   ├── catalog/
│   ├── carts/
│   ├── checkout/
│   ├── orders/
│   ├── load-generator/
│   ├── app/
│   ├── e2e/
│   ├── misc/
│   └── docker-compose.yaml
│
├── terraform/
│   ├── backend/                           # Remote state bootstrap
│   ├── vpc/                               # Production VPC
│   ├── environments/
│   │   └── production/                    # Amazon EKS Cluster
│   │
│   ├── platform/
│   │   ├── bootstrap/                     # Core platform services
│   │   │   ├── metrics-server/
│   │   │   ├── pod-identity/
│   │   │   ├── ebs-csi-driver/
│   │   │   ├── secrets-store-csi/
│   │   │   └── aws-secrets-provider/
│   │   │
│   │   └── networking/                    # Platform networking
│   │       ├── aws-load-balancer-controller/
│   │       ├── external-dns/
│   │       ├── ingress/
│   │       └── certificates/
│   │
│   └── dataplane/                         # AWS Managed Services
│       ├── catalog-rds/                   # Amazon RDS MySQL
│       ├── carts-dynamodb/                # Amazon DynamoDB
│       ├── checkout-redis/                # Amazon ElastiCache Redis
│       ├── orders-rds/                    # Amazon RDS PostgreSQL + Amazon SQS
│       └── README.md
│
├── kubernetes/                            # Kubernetes manifests
│   ├── namespaces/
│   ├── common/
│   ├── ingress/
│   ├── ui/
│   ├── catalog/
│   ├── carts/
│   ├── checkout/
│   └── orders/
│
├── helm/                                # Helm Charts
│   ├── ui/
│   ├── catalog/
│   ├── carts/
│   ├── checkout/
│   └── orders/
│
├── observability/                      
│   ├── adot/
│   ├── prometheus/
│   ├── grafana/
│   ├── cloudwatch/
│   └── xray/
│
├── docs/
│   ├── architecture/
│   ├── diagrams/
│   ├── adr/
│   ├── runbooks/
│   └── screenshots/
│
├── scripts/
│
├── .github/
│   └── workflows/
│
├── LICENSE
├── README.md
├── package.json
└── yarn.lock
```

> **Note:** Retail Store v2 is built incrementally. Some directories represent the target production architecture and will be introduced as the platform evolves through future milestones.

---

# Platform Progress

| Platform Layer | Status |
|----------------|--------|
| ✅ Containerization | Complete |
| ✅ Production VPC | Complete |
| ✅ Amazon EKS Platform | Complete |
| ✅ Platform Bootstrap | Complete |
| ✅ AWS Managed Dataplane | Complete |
| ✅ Kubernetes Native Deployments | Complete |
| ✅ AWS Load Balancer Controller | Complete |
| ✅ ExternalDNS | Complete |
| ✅ Route53 Integration | Complete |
| ✅ ACM HTTPS | Complete |
| ⏳ Helm Charts | In Progress |
| ⏳ GitOps (Argo CD) | Planned |
| ⏳ Progressive Delivery (Argo Rollouts) | Planned |
| ⏳ Observability | Planned |
| ⏳ Production Hardening | Planned |
---

# Current Platform

The platform currently includes the following production capabilities:

- ✅ Amazon EKS 1.34
- ✅ Production VPC
- ✅ Amazon RDS MySQL
- ✅ Amazon RDS PostgreSQL
- ✅ Amazon DynamoDB
- ✅ Amazon ElastiCache Redis
- ✅ AWS Secrets Manager
- ✅ Amazon EBS CSI Driver
- ✅ AWS Secrets Store CSI Driver
- ✅ Amazon EKS Pod Identity
- ✅ AWS Load Balancer Controller
- ✅ ExternalDNS
- ✅ Amazon Route53
- ✅ ACM Wildcard Certificate
- ✅ Internet-facing AWS Application Load Balancer
- ✅ Secure HTTPS Endpoint

### Live Application

**https://shop.tinacloud.dev**


# High-Level Architecture

```text
                    GitHub
                       │
                       ▼
          GitHub Actions CI/CD
                       │
                       ▼
              Amazon ECR Images
                       │
                       ▼
               GitOps Repository
                       │
                       ▼
                  ArgoCD GitOps
                       │
                       ▼
              Amazon EKS Cluster
                       │
      ┌────────────────────────────────┐
      │                                │
      │        UI                      │
      │        Catalog                 │
      │        Carts                   │
      │        Checkout                │
      │        Orders                  │
      │                                │
      └────────────────────────────────┘
                       │
         AWS Managed Services
      ┌───────────────────────────────┐
      │ Amazon RDS MySQL              │
      │ Amazon RDS PostgreSQL         │
      │ Amazon DynamoDB               │
      │ Amazon ElastiCache Redis      │
      │ Amazon SQS                    │
      │ AWS Secrets Manager           │
      └───────────────────────────────┘
                       │
             OpenTelemetry + ADOT
                       │
                       ▼
      Amazon Managed Prometheus (AMP)
                       │
                       ▼
      Amazon Managed Grafana (AMG)
```

---

# Technology Stack

## Cloud

- AWS
- Amazon EKS
- Amazon ECR
- Amazon RDS
- Amazon DynamoDB
- Amazon ElastiCache Redis
- Amazon SQS
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

## Containers

- Docker
- Multi-stage Docker Builds
- Amazon ECR

---

## Kubernetes

- Deployments
- Services
- ConfigMaps
- ServiceAccounts
- Pod Identity
- Security Contexts
- Resource Requests & Limits
- Startup Probes
- Readiness Probes
- Liveness Probes
- Horizontal Pod Autoscaler
- Pod Disruption Budgets
- Topology Spread Constraints

---

## GitOps & Progressive Delivery

- Helm
- ArgoCD
- Argo Rollouts
- Canary Deployments
- Blue/Green Deployments
- Automated Rollbacks
- Analysis Templates

---

## Observability

- OpenTelemetry
- AWS Distro for OpenTelemetry (ADOT)
- Amazon Managed Prometheus
- Amazon Managed Grafana
- AWS X-Ray
- CloudWatch Logs
- Prometheus Metrics
- Distributed Tracing

---

## Security

- AWS Pod Identity
- AWS Secrets Manager
- Secrets Store CSI Driver
- Non-root Containers
- Read-only Root Filesystem
- RuntimeDefault Seccomp
- Dropped Linux Capabilities

---

# Platform Capabilities

- Production-grade Amazon EKS Platform
- Infrastructure as Code with Terraform
- GitOps using ArgoCD
- Progressive Delivery with Argo Rollouts
- Production-ready Helm Charts
- Secure Secret Management
- AWS Pod Identity
- Horizontal Pod Autoscaling
- Karpenter Node Autoscaling
- Health Probes
- Pod Disruption Budgets
- Topology Spread Constraints
- OpenTelemetry Instrumentation
- Amazon Managed Prometheus
- Amazon Managed Grafana
- GitHub Actions CI/CD

---

# Production Improvements

Retail Store v2 is a complete re-architecture of the original Retail Store application using modern Platform Engineering principles and production Kubernetes patterns.

### Security

- Non-root Containers
- Read-only Root Filesystem
- RuntimeDefault Seccomp
- Dropped Linux Capabilities

### Reliability

- Startup Probes
- Readiness Probes
- Liveness Probes
- Pod Disruption Budgets

### Scalability

- Horizontal Pod Autoscaler
- Karpenter
- Topology Spread Constraints

### GitOps

- ArgoCD
- Declarative Deployments
- Git-driven Operations

### Progressive Delivery

- Canary Deployments
- Blue/Green Deployments
- Automated Rollbacks
- Analysis Templates

### Observability

- OpenTelemetry
- AWS Distro for OpenTelemetry
- Amazon Managed Prometheus
- Amazon Managed Grafana
- AWS X-Ray
- CloudWatch Logs

---

# CI/CD Pipeline

```text
Developer
    │
    ▼
GitHub Push
    │
    ▼
GitHub Actions
    │
    ├── Build
    ├── Test
    ├── Scan
    └── Push Image
            │
            ▼
      Amazon ECR
            │
            ▼
     GitOps Repository
            │
            ▼
          ArgoCD
            │
            ▼
     Argo Rollouts
            │
            ▼
        Amazon EKS
```

---

# Platform Roadmap

Future enhancements include:

- Chaos Engineering
- Kyverno Policies
- OPA Gatekeeper
- Argo Events
- Crossplane
- Multi-Cluster GitOps
- Service Mesh (Istio)
- FinOps Dashboards
- eBPF Observability