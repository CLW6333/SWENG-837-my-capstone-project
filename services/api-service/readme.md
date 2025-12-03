 API Service

 Purpose

The API Service is the central backend component of the Online Learning Platform with Adaptive Practice. It exposes secure REST endpoints used by the Web App and orchestrates all interactions involving courses, assignments, grades, adaptive practice sessions, analytics, and user role–specific operations.

The API Service enforces business rules, validates requests, coordinates communication with the AI Service, and interacts with the database. It serves as the core application layer in the system's layered architecture.

 Responsibilities

- Validate and process requests from the Web App
- Enforce authentication and role-based authorization rules
- Manage LMS entities: courses, users, enrollments, assignments, grades
- Analyze student performance data and identify areas of struggle
- Create and manage adaptive practice sessions for students
- Communicate with the AI Service to generate questions, explanations, and references
- Persist session results and performance metrics into the database
- Expose reporting and analytics endpoints for instructors and administrators

 Interaction With Other Services

 Web App
The Web App communicates with the API Service through:
- Secure REST API calls
- OAuth2/OpenID Connect identity tokens issued by Azure Active Directory  
All user-facing actions (creating practice sessions, submitting answers, viewing grades) start as API calls.

 AI Service
The API Service is the exclusive client of the AI Service.

It sends:
- Concept IDs or learning objectives
- Student struggle areas
- Instructor-approved content references

It receives:
- AI-generated practice questions
- Explanations for incorrect answers
- Reference links to course content

The AI Service never directly communicates with the Web App or the database.

 Database
The API Service interacts with the relational database to:
- Store and retrieve user and course data
- Track student concept mastery
- Store practice sessions and practice questions
- Maintain analytics records

Queries and persistence logic are part of the Infrastructure Layer but invoked through the API.

 Azure Active Directory
The API Service validates identity tokens from Azure AD and enforces:
- Student permissions
- Instructor permissions
- Administrator permissions  
No request is processed without proper authentication.

 Related UML Diagrams

The following UML artifacts describe the API Service’s role:

- Component Diagram – shows the API as the central backend service
- Sequence Diagrams – illustrate request flows for creating sessions and submitting answers
- Class Diagram – maps directly to the data models used in API request/response objects
- Domain Model – defines the conceptual entities handled by the API
- Deployment Diagram – the API App is hosted in Azure App Service (Backend Tier)

All diagrams are available under `assets/diagrams/png/`.

 Architectural Justification

The API Service is isolated as the core application layer to support:

- Clean separation of concerns (UI vs. business logic vs. AI processing)
- Scalability across independent tiers
- Higher security by preventing direct client access to data stores and AI systems
- Maintainable business rules aligned with GRASP principles (Controller, Information Expert)
- Testability of domain logic separate from the interface

 Technology Stack (Hypothetical)

A realistic stack for this service would include:

- Node.js/Express, Python/FastAPI, or .NET Core Web API
- Azure App Service for deployment
- Azure SQL Database for persistence
- Azure AD for identity and access management
- REST/JSON communication format
- Azure OpenAI integration via server-side API calls

(Implementation is not required for this project; this is conceptual documentation.)

 Folder Purpose

This folder documents the responsibilities and boundaries of the API Service. No executable code is required as the project focuses on architectural design rather than implementation.
