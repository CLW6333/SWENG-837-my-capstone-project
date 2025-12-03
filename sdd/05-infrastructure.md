Deployment Diagram
 
Figure 9: Deployment Diagram (deployment diagram.png)

Deployment Description

Figure 9 illustrates how the main components of the online learning platform are deployed on Microsoft Azure. Students, Instructors, and Administrators access the system through a standard Web Browser. All traffic from the browser to the cloud will use secure HTTPS connections. 

In the Azure cloud, the Web App (frontend) is hosted by the Azure App Service where it provides the users a interface to the course, grades, and other materials. The frontend uses RESTful API calls to communicate with an API App (Backend).The API app aggregates the logical services defined in the component diagram.

Azure Active Directory integrates user authentication and authorization via tokens when a user attempts to sign in. An Azure SQL Database (LMS DB) takes core application data such as users, enrollments, courses, assessments and more from the API App. Azure SQL Database (Analytics DB) stores the analytics and reporting data without overloading the transactional store. 

Azure OenAI Service is the basis of the adaptive learning features in the system acting as the AI Practice Service. The backend API calls this service to generate personalized practice questions and explanations based on the student’s performance. Course files, media, and application logs are stored in an Azure Storage Account. Outbound communications like course announcements the API app integrates with Azure Communication Services. This service is used to send emails and other notifications like push notifications to users.

 Threat Modeling (STRIDE)

The STRIDE framework is used to identify potential security threats across the Online Learning Platform components, especially given the reliance on cloud services, authentication, and AI integration.

| STRIDE Category | Description of Threat | Relevant System Component(s) | Potential Impact | Mitigation Strategies |
|-----------------|-----------------------|------------------------------|------------------|------------------------|
| S – Spoofing | Attacker impersonates a student, instructor, admin, or API service. | Web App, API Service, Azure AD Authentication | Unauthorized access to grades, course content, or AI practice data. | Enforce Azure AD OAuth2/OIDC; token validation in API Service; MFA for instructors/admins; HTTPS everywhere; secure cookie settings. |
| T – Tampering | Modification of practice sessions, grades, or AI-generated content in transit or in storage. | API Service, Database, AI Service communication | Corrupted student records, manipulated practice results, incorrect analytics. | TLS 1.2+ encryption; signed JWT tokens; database row-level access control; server-side validation; restricted write permissions. |
| R – Repudiation | Users deny performing certain actions (e.g., completing a practice session, modifying course data). | Web App, API Service Logs | Audit disputes, loss of academic integrity verification. | Centralized logging (Azure Application Insights); timestamps; action tracing; immutable audit logs; instructor/admin-only modification paths. |
| I – Information Disclosure | Sensitive data (grades, weaknesses, instructor feedback) is exposed improperly. | API Service, Database, Web App | Privacy violations; FERPA non-compliance; exposure of student performance. | Role-based access control; least-privilege database queries; encrypt sensitive data (AES-256); avoid sending PII to AI Service; strict access controls. |
| D – Denial of Service (DoS) | System overwhelmed by traffic or malicious requests targeting Web App or API Service. | Web App, API Service, Azure App Service | Service outages; students unable to complete assignments or practice; downtime. | Azure autoscaling; rate limiting; Azure Web Application Firewall; API throttling; health checks; redundant instances. |
| E – Elevation of Privilege | Student gains instructor privileges or admin-level access, intentionally or by exploiting a flaw. | Web App, API Service, Authentication Layer | Unauthorized grade changes; content manipulation; massive data exposure. | Server-side role checks; Azure AD RBAC; privilege separation; zero-trust access; administrators-only endpoints; secure storage of tokens. |
