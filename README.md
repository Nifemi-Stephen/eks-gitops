#Cloud-Native GitOps Platform on AWS EKS

A production-grade infrastructure-as-code project utilizing Terraform to provision an AWS Elatic Kubernetes Service (EKS) cluster and configure a complete ArgoCD GitOps workflow

🔧 Tech Stack:
• Terraform
• AWS EKS
• Docker
• Amazon ECR
• GitHub Actions
• Helm
• Argo CD
• NGINX Ingress Controller
• Cert Manager
• Prometheus
• Grafana
• Loki

Project Overview and Key Features

A fully automated, end-to-end provisioning of a cloud-native paltform on AWS. Eliminating manual configuration errors by defining both infrastructure and application delivery pipline as code, and driven by Git lifecycle events.

Key Features:

The entire AWS architecture, comprising the VPC, subnets, EKS cluster, node groups and ArgoCD is provisioned using Terraform, entirely eliminating manual AWS console configuration. This infrastructure as code strategy guarantees:

Reviewed pull request for all changes
Pre-deployment impact visibility using terraform plan
A complete git-based audit trail
Seamless multi-region replication and easy tear-down of resources

Infrastructure and Application Architecture
![alt text](98B5A511-C62F-4496-8140-E19631993560.PNG)

```text
┌─────────────────────────────┐
│        Developer            │
└─────────────┬───────────────┘
              │ git push
              ▼
┌─────────────────────────────┐
│          GitHub             │
│ Source Code + Helm Charts   │
└─────────────┬───────────────┘
              │
              ▼
┌─────────────────────────────┐
│      GitHub Actions         │
│                             │
│ • Build Docker Image        │
│ • Run Validation            │
│ • Push Image to ECR         │
│ • Update values.yaml        │
└─────────────┬───────────────┘
              │
              ▼
┌─────────────────────────────┐
│         Amazon ECR          │
│ Docker Image Registry       │
└─────────────┬───────────────┘
              │
              ▼
┌─────────────────────────────┐
│          Argo CD            │
│ GitOps Continuous Delivery  │
└─────────────┬───────────────┘
              │ Sync
              ▼
═══════════════════════════════════
      AWS EKS CLUSTER
═══════════════════════════════════

┌─────────────────────────────┐
│     NGINX Ingress           │
└─────────────┬───────────────┘
              │
              ▼
┌─────────────────────────────┐
│       Application           │
│       Kubernetes            │
│       Deployment            │
└─────────────┬───────────────┘
              │
     ┌────────┴────────┐
     ▼                 ▼

┌───────────────┐ ┌───────────────┐
│ Cert Manager  │ │ Prometheus    │
│ TLS/HTTPS     │ │ Metrics       │
└───────┬───────┘ └───────┬───────┘
        │                 │
        ▼                 ▼
┌───────────────┐ ┌───────────────┐
│ Grafana       │ │ Loki          │
│ Dashboards    │ │ Logs          │
└───────────────┘ └───────────────┘
```
═══════════════════════════════════
 Terraform Provisioned:
 • VPC
 • Public & Private Subnets
 • Security Groups
 • EKS Cluster
 • Node Groups
═══════════════════════════════════
```