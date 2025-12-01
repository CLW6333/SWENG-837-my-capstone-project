# Online Learning Platform with Adaptive Practice – SWENG 837 Course Project

### Overview



This repository contains the complete software design documentation for an Online Learning Platform with Adaptive Learning Support, created as part of the SWENG 837 – Software System Design course project.



The system enhances traditional LMS platforms by integrating AI-generated practice sessions tailored to each student based on their performance in assessments and completed course materials.



The project includes:



Business requirements \& non-functional requirements



Full UML diagram suite



Cloud deployment architecture (Azure)



Database schema \& skeleton class definitions



Design pattern application (GRASP, SOLID, GoF, layered architecture)



Supporting presentation materials



### Repository Structure

sdd/                → Software Design Documents (Markdown)

assets/diagrams/    → UML diagrams (PlantUML + PNG exports)

specs/              → API and database specifications (to be added)

decisions/          → Architecture Decision Records (to be added)

services/           → Service stubs / structure (to be added)

README.md           → Project overview

### UML Diagrams (PNG Images)



All diagrams are located in the /diagrams folder:



Figure 1 – Use Case Diagram



Figure 2 – Domain Model



Figure 3 – Class Diagram



Figure 4 – Sequence Diagram: Request Practice Session



Figure 5 – Sequence Diagram: Submit Answer



Figure 6 – State Diagram: PracticeSession Lifecycle



Figure 7 – Activity Diagram (Swimlane)



Figure 8 – Component Diagram



Figure 9 – Azure Deployment Diagram



### PlantUML Source Files



All .puml files corresponding to the diagrams are included in /plantuml, enabling regeneration or modification.



### Cloud Deployment



The system is deployed on Microsoft Azure using:



Azure App Service



Azure SQL Databases



Azure Storage Account



Azure OpenAI Service



Azure Active Directory (Entra ID)



Azure Communication Services



This design supports scalability, AI integration, and enterprise-grade security.



### Design Patterns Implemented



The system incorporates:



GRASP: Controller, Information Expert, Low Coupling, Creator



SOLID: SRP, OCP, LSP, ISP, DIP



GoF: Facade, Strategy, Repository-style access



Architectural Patterns: Layered architecture, service decomposition



Each pattern is tied to specific UML diagrams for clarity and justification.



### Author



Charles L White Jr

SWENG 837 – Software System Design

Pennsylvania State University

