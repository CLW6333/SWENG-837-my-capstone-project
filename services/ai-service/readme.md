 AI Service

 Purpose

The AI Service is responsible for generating personalized adaptive practice content for students based on their performance, instructor-provided materials, and course learning objectives. It creates practice questions, explanations, and reference links tailored to each student’s areas of struggle.

The AI Service does not interact directly with users or the Web App. Instead, it receives structured requests from the API Service and returns AI-generated outputs that align with instructor-approved content.

This service supports the adaptive learning goals of the platform by offering scalable, automated practice generation without requiring manual instructor intervention.

 Responsibilities

- Generate personalized practice questions for a student based on concepts they are struggling with
- Produce detailed explanations for incorrect answers using instructor-approved materials
- Link explanations to relevant lessons, book pages, or course content
- Maintain strict boundaries to ensure AI outputs do not modify official graded assignments
- Ensure practice content is context-aware and aligned with course learning objectives
- Return structured responses to the API Service in a predictable format

 Interaction With Other Services

 API Service
The API Service is the only system that communicates with the AI Service.

It sends:
- Student performance indicators
- Concept identifiers associated with weaknesses
- Instructor-approved content blocks
- Any constraints on practice question format or difficulty

The AI Service returns:
- AI-generated practice questions
- Suggested answer keys
- Explanations derived from approved content
- Reference links for remediation

The separation ensures:
- Security (AI never receives direct user data)
- Content validity (AI only uses approved inputs)
- Proper orchestration (API Service coordinates session lifecycle)

 Web App
The AI Service never communicates with the Web App.

 Database
The AI Service has no direct database access.  
All persistence is handled by the API Service.

 Azure OpenAI Service
This component uses Azure OpenAI as the underlying large language model provider to generate:
- Practice questions  
- Explanations  
- Reference-based remediation  

Azure OpenAI is chosen for:
- Enterprise security  
- Data isolation guarantees  
- Strong alignment with Azure AD and App Service ecosystem

 Related UML Diagrams

The following diagrams illustrate how the AI Service integrates within the system:

- Sequence Diagrams – API Service calls AI Service to generate practice sessions or explanations  
- Component Diagram – shows AI Service as an isolated subsystem behind the API layer  
- Deployment Diagram – AI Service hosted as a server-side Azure function or containerized service  
- Class Diagram – structures returned by the AI match the PracticeQuestion and PracticeAnswerResult models  

These diagrams are available under `assets/diagrams/png/`.

 Architectural Justification

Reasons for isolating the AI Service:

- Ensures that AI-generated content never bypasses instructor control  
- Keeps student PII out of AI prompts, improving privacy compliance  
- Enables independent scaling of AI workloads separate from the main API  
- Allows swapping or upgrading the AI engine without affecting other system components  
- Improves maintainability by keeping adaptive practice logic isolated from LMS business logic  
- Aligns with layered architecture principles and microservice-aligned boundaries

 Technology Stack (Hypothetical)

While implementation is not required, the AI Service would likely utilize:

- Python (FastAPI) or Node.js for prompt construction
- Calls to Azure OpenAI Service (GPT or similar models)
- Containerization or Azure Function hosting for elastic compute usage
- JSON-based contracts for communication with the API Service

 Folder Purpose

This folder documents the responsibilities and boundaries of the AI Service.  
It does not include executable source code, as the capstone project focuses on software design rather than implementation.
