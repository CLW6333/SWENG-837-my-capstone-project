# Online Learning Platform with Adaptive Practice – SWENG 837 Course Project

## Overview

This repository contains the complete software design documentation for an **Online Learning Platform with Adaptive Learning Support**, created as part of the **SWENG 837 – Software System Design** course project.

The system extends traditional LMS platforms by adding AI-generated, personalized practice sessions that target each student's areas of struggle. Using instructor-approved content, the system analyzes a student's performance, identifies weak topics, and generates tailored quiz questions, explanations, and remediation references.

This repository includes:

- Problem Statement, Business Requirements, and Non-Functional Requirements  
- Full UML design suite (Use Case, Domain, Class, Sequence, State, Activity, Component, Deployment)  
- Cloud deployment architecture modeled on Microsoft Azure  
- Database schema and skeleton class definitions  
- API specifications (OpenAPI)  
- Architecture Decision Records (ADRs)  
- STRIDE threat model and infrastructure view  
- Service decomposition documentation  
- Presentation and navigation materials for the final project  

---

## Repository Structure
sdd/ → Software Design Documents (01–05 Views)
assets/diagrams/ → UML diagrams (PNG + PlantUML)
specs/ → API specification (openapi.yaml) and DB schema (schema.sql)
decisions/ → Architecture Decision Records (ADR-001 to ADR-003)
services/ → Service boundaries (Web App, API Service, AI Service)
README.md → Project overview and navigation


Each folder aligns with the structure required by the Final Project Submission Guide.

---

## UML Diagrams

All PNG diagram images are located in: assets/diagrams/png/ and PlantUML source files are in: assets/diagrams/plantuml/


### Diagram List

- **Use Case Diagram.png**
- **domain MODEL.png**  
- **domain class diagram.png**
- **Sequence Diagram #1 – Request Adaptive Practice Session (Synchronous).png**
- **Sequence Diagram #2 – Complete AI-Generated Practice Quiz.png**
- **Practice Session State Diagram.png**
- **activity diagram.png**
- **component diagram.png**
- **deployment diagram.png**

These diagrams are referenced throughout the SDD files.

---

## PlantUML Source Files

All corresponding `.puml` files for the diagrams are included under: assets/diagrams/plantuml/


These files allow instructors, graders, or future developers to regenerate or modify the diagrams.

---

## Specifications (API + Database)

The `specs/` folder includes:

- **openapi.yaml** — REST API specification for adaptive practice endpoints  
- **schema.sql** — Database schema (DDL) supporting courses, users, practice sessions, mastery tracking, and LMS data structures  

These specifications align with the data design in `03-data-design.md` and the service architecture documented in `services/`.

---

## Architecture Decision Records (ADRs)

The `decisions/` folder captures major architectural decisions, including:

- **ADR-001:** Selection of Microsoft Azure as the cloud platform  
- **ADR-002:** Decision to use AI-generated adaptive practice instead of adaptive difficulty  
- **ADR-003:** Adoption of a layered architecture for maintainability and separation of concerns  

These ADRs help document the rationale behind the project's architectural direction.

---

## Services

The `services/` folder contains design documentation (not executable code) for the three main service boundaries:

- **web-app/** – User interface layer, Azure AD login, front-end rendering  
- **api-service/** – Core backend logic, orchestration, secure access enforcement  
- **ai-service/** – Adaptive learning engine interfacing with Azure OpenAI  

This structure reflects the service decomposition illustrated in the Component and Deployment diagrams.

---

## Cloud Deployment

The system is designed for deployment on **Microsoft Azure**, including:

- Azure App Service (Web App + API)  
- Azure SQL Database (LMS DB + Analytics DB)  
- Azure Storage Account (content, logs, media)  
- Azure OpenAI Service (adaptive practice generation)  
- Azure Active Directory / Entra ID (authentication & RBAC)  
- Azure Communication Services (notifications)  

This architecture supports high scalability (10,000+ concurrent users), secure access control, and strong performance SLAs.

---

## Security & Threat Modeling

A full STRIDE threat model is included in: sdd/05-infrastructure.md


It covers Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, and Elevation of Privilege across the Web App, API, AI integration, and Azure infrastructure.

---

## Design Patterns Implemented

The system incorporates:

- **GRASP:** Controller, Information Expert, Low Coupling, Creator  
- **SOLID:** SRP, OCP, LSP, ISP, DIP  
- **GoF:** Facade, Strategy, Repository-style access  
- **Architectural Patterns:** Layered architecture, service decomposition  

Patterns are explicitly tied to UML artifacts in the SDD.

---

## Video Presentation

A link to the required 8–16 minute project video will be added here:




