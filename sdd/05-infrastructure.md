Deployment Diagram
 
Figure 9: Deployment Diagram (deployment diagram.png)

Deployment Description

Figure 9 illustrates how the main components of the online learning platform are deployed on Microsoft Azure. Students, Instructors, and Administrators access the system through a standard Web Browser. All traffic from the browser to the cloud will use secure HTTPS connections. 

In the Azure cloud, the Web App (frontend) is hosted by the Azure App Service where it provides the users a interface to the course, grades, and other materials. The frontend uses RESTful API calls to communicate with an API App (Backend).The API app aggregates the logical services defined in the component diagram.

Azure Active Directory integrates user authentication and authorization via tokens when a user attempts to sign in. An Azure SQL Database (LMS DB) takes core application data such as users, enrollments, courses, assessments and more from the API App. Azure SQL Database (Analytics DB) stores the analytics and reporting data without overloading the transactional store. 

Azure OenAI Service is the basis of the adaptive learning features in the system acting as the AI Practice Service. The backend API calls this service to generate personalized practice questions and explanations based on the student’s performance. Course files, media, and application logs are stored in an Azure Storage Account. Outbound communications like course announcements the API app integrates with Azure Communication Services. This service is used to send emails and other notifications like push notifications to users.
