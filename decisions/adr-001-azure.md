ADR-001: Selection of Microsoft Azure as the Cloud Platform

Context

The Online Learning Platform with Adaptive Practice requires a cloud environment capable of:

- Hosting a scalable web application accessible to thousands of concurrent users  
- Running backend services, including an AI-driven adaptive learning engine  
- Providing secure role-based authentication for students, instructors, and administrators  
- Persisting structured LMS data (courses, users, grades, analytics)  
- Providing high reliability, global accessibility, and compliance with educational privacy standards  
- Offering integrated services for identity, storage, databases, AI, and messaging  

The platform must also support:

- Elastic scaling during peak usage periods (e.g., exam weeks)  
- Secure communications (TLS / HTTPS)  
- Integration with an AI model for generating personalized quizzes and explanations  

The project requires a cloud design, not just a containerized local deployment.

Multiple cloud vendors were considered, including:

- Amazon Web Services (AWS)  
- Google Cloud Platform (GCP)  
- Microsoft Azure  

A decision was needed on which cloud provider would best support deployment of the LMS and its adaptive learning subsystem.

Decision

Microsfot Azure was selected as the primary cloud platform.

The deployment will rely on:

- Azure App Service (hosting Web App + API backend)  
- Azure SQL Database (primary LMS relational database)  
- Azure Storage Account (files, logs, course media)  
- Azure OpenAI Service (AI-generated practice quizzes and explanations)  
- Azure Active Directory (Entra ID) (authentication and RBAC)  
- Azure Communication Services (messaging and notifications)  
- Azure Load Balancer & Autoscaling (performance and scalability needs)

Rationale

Azure is the most suited cloud provider for this system for several reasons:

 1. Native Integration with AI (Azure OpenAI Service)
The adaptive learning engine depends on:

- Generating personalized quizzes  
- Producing explanations based on instructor-approved content  

Azure OpenAI provides:

- Enterprise-grade security  
- Data boundary guarantees  
- Seamless integration with App Service  

This reduces complexity compared to integrating external AI APIs.


 2. Streamlined Identity Management with Azure Active Directory
The platform requires:

- Strong authentication  
- Role-based access control  
- Separation between students, instructors, and administrators  

Azure AD provides built-in support for:

- OAuth2 / OIDC authentication  
- SSO  
- Token-based authorization between services  

This simplifies security implementation.


 3. Excellent Support for Scalable Web Applications
Azure App Service offers:

- Automatic scaling  
- Managed hosting  
- Built-in CI/CD integration  
- Monitoring via Application Insights  

This matches the requirement for supporting 10,000+ concurrent student sessions.


 4. Managed Relational Database via Azure SQL
The LMS needs:

- Strong consistency  
- Transaction support  
- Analytics queries  

Azure SQL provides:

- Automated backups  
- Geo-replication  
- High availability  
- Secure data encryption  


 5. End-to-End Ecosystem Cohesion
Unlike AWS or GCP, Azure provides a highly unified environment where:

- Web apps  
- Databases  
- Identity  
- AI  
- Messaging  

…all integrate smoothly and securely with minimal configuration overhead.

This reduces development complexity and improves reliability.

Consequences

 Positive
- Simplified authentication and authorization using Azure AD  
- Scalable application hosting using Azure App Service  
- Native AI support for adaptive learning workflows  
- Reliable database and storage options  
- Unified monitoring and diagnostic tooling  

 Negative
- Vendor lock-in to Azure services  
- Higher cost for managed services compared to self-hosted options  
- Azure AI limits may require quota approvals for large institutions  
