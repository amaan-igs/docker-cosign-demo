# Docker Cosign Demo - Enterprise Container Security Pipeline

[![Build Status](https://github.com/amaan-igs/docker-cosign-demo/workflows/Docker%20Build,%20Push%20&%20Sign%20with%20Cosign/badge.svg)](https://github.com/amaan-igs/docker-cosign-demo/actions)
[![Harbor Registry](https://img.shields.io/badge/Registry-Harbor-326CE5?logo=harbor&logoColor=white)](https://registry.dev.sudoconsultants.com)
[![Cosign](https://img.shields.io/badge/Signed%20with-Cosign-4B9CD3?logo=sigstore&logoColor=white)](https://sigstore.dev/)

## Overview

This project demonstrates a complete enterprise-grade container security pipeline implementing **CNCF Project Harbor** as a private OCI-compliant registry with integrated **Trivy vulnerability scanning**, **SBOM generation**, and **container image signing** using **Sigstore Cosign**. The entire workflow is automated through **GitHub Actions** and **GitLab CI/CD** pipelines.

## Architecture
<img width="2016" height="788" alt="main-WEB-FLOW" src="https://github.com/user-attachments/assets/48417d23-20db-427e-9815-018d38aea8cb" />

## Features

### Container Registry & Security
- **CNCF Harbor Registry**: Private OCI-compliant container registry
- **Trivy Integration**: Built-in vulnerability scanning and assessment
- **SBOM Generation**: Software Bill of Materials for supply chain security
- **Cosign Signing**: Keyless image signing with Sigstore for provenance
- **Security Policies**: Automated security policy enforcement

### CI/CD Integration
- **GitHub Actions**: Automated build, scan, sign, and deploy pipeline
- **GitLab CI/CD**: Mirror implementation on GitLab infrastructure
- **Multi-Architecture**: Support for `linux/amd64` and `linux/arm64`
- **Smart Triggers**: Pipeline runs only on relevant file changes

## Technology Stack

| Component | Technology | Purpose |
|-----------|------------|---------|
| **Registry** | CNCF Harbor | Private OCI-compliant container registry |
| **Security Scanning** | Trivy | Vulnerability assessment and SBOM generation |
| **Image Signing** | Sigstore Cosign | Keyless container image signing |
| **CI/CD (GitHub)** | GitHub Actions | Automated pipeline orchestration |
| **CI/CD (GitLab)** | GitLab CI | Alternative pipeline implementation |
| **Container Runtime** | Docker | Container building and management |


## Project Structure

```
docker-cosign-demo/
├── .github/workflows/
│   └── action.yml          # GitHub Actions pipeline
├── images/                 # Static assets (certificates)
│   ├── AWS-*.png          # Professional certifications
│   └── LFS158-*.png       # Kubernetes certification
├── Dockerfile             # Multi-stage container build
├── index.html             # Demo web application
└── README.md              # This documentation
```

## Getting Started

### Prerequisites

- Harbor Registry instance with Trivy integration
- GitHub repository with appropriate secrets configured
- Docker and Docker Buildx for local development

### Environment Setup

#### GitHub Actions Secrets & Variables

**Repository Variables:**
```bash
HARBOR_USERNAME=<your-harbor-username>
```

**Repository Secrets:**
```bash
HARBOR_TOKEN=<your-harbor-access-token>
```

#### Pipeline Configuration

The pipeline automatically triggers on changes to:
- `*.html` files
- `Dockerfile`
- `images/**` directory
- `.github/workflows/**` files

And **excludes** Markdown documentation changes to optimize CI/CD resources.

## Pipeline Workflow

### 1. Source Control Trigger
- Push to main branch or pull request creation
- Smart path filtering to avoid unnecessary builds

### 2. Container Build
- Multi-architecture Docker build (`linux/amd64`, `linux/arm64`)
- Optimized caching with GitHub Actions cache
- Semantic versioning with branch and SHA tagging

### 3. Registry Push
- Secure push to Harbor private registry
- Automatic image metadata and labeling
- OCI-compliant image format

### 4. Security Scanning
- Trivy vulnerability assessment
- SBOM generation for supply chain visibility
- Policy enforcement based on severity levels

### 5. Image Signing
- Keyless signing with Sigstore Cosign
- OIDC token-based authentication
- Transparent signature storage

## Multi-Platform Implementation

This project is implemented across two major DevOps platforms:

### GitHub (Primary)
- **Repository**: [amaan-igs/docker-cosign-demo](https://github.com/amaan-igs/docker-cosign-demo)
- **Pipeline**: GitHub Actions
- **Features**: Advanced caching, multi-arch builds, OIDC integration

### GitLab (Mirror)
- **Repository**: [amaan-igs/cosign-ci](https://gitlab.com/amaan-igs/cosign-ci)
- **Pipeline**: GitLab CI/CD
- **Infrastructure**: Same Harbor registry and security policies

Both implementations use identical infrastructure and security configurations, demonstrating platform-agnostic container security practices.

## Enterprise Benefits

### Security & Compliance
- **Supply Chain Security**: Complete provenance tracking with SBOM
- **Vulnerability Management**: Automated scanning and reporting
- **Image Integrity**: Cryptographic signing prevents tampering
- **Compliance Ready**: Meets enterprise security standards

### Operational Excellence
- **Automated Workflows**: Reduced manual intervention
- **Multi-Platform Support**: Consistent across different architectures
- **Cost Optimization**: Smart triggering reduces unnecessary builds
- **Monitoring & Observability**: Comprehensive logging and reporting

## Security Features

### Trivy Integration
- **CVE Detection**: Comprehensive vulnerability database
- **License Scanning**: Open source license compliance
- **Secret Detection**: Embedded credentials identification
- **SBOM Generation**: Complete dependency tracking

### Cosign Signing
- **Keyless Architecture**: No key management overhead
- **OIDC Integration**: Leverages existing identity providers
- **Transparency Log**: Public verification through Rekor
- **Policy Enforcement**: Admission controllers for signed images

## Use Cases

This implementation serves as a reference for:

- **Enterprise Container Security**: Production-ready security pipeline
- **DevSecOps Integration**: Security-first development practices
- **Compliance Requirements**: Regulatory compliance automation
- **Supply Chain Security**: End-to-end provenance tracking
- **Multi-Cloud Deployment**: Platform-agnostic container management

## Author

**Amaan Ul Haq Siddiqui**
- Email: amaanulhaq.s@outlook.com
- GitHub: [@amaan-igs](https://github.com/amaan-igs)
- GitLab: [@amaan-igs](https://gitlab.com/amaan-igs)

---

*This project showcases the integration of CNCF technologies for enterprise container security, demonstrating practical implementation of Harbor, Trivy, and Cosign in production-ready CI/CD pipelines.*
