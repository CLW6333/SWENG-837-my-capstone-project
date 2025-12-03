Problem Statement
Over the last few decades there has been a shift of universities and professional training programs that transitioned from in-person to online and now even hybrid formats. This allows students and professionals to be able to study and learn while adhering to their own schedules. Many Learning Management Systems (LMS) give a foundational basis for things like grade tracking, content delivery, messaging with the class and teacher, and even online books. These systems lack personalized academic support that adapts to how each student learns.

Many courses and subjects are built in a static environment where you learn the lesson from text or lectures then take assessments based on that information. This method can cause some students or professionals to struggle with specific topics as they only have the material given to them. Instructors and even student resources may not have the time or their own resources to learn where the struggle stems from then develop a plan to help them study. As a result these students can fall behind about key concepts while the instructor only sees the grades and not why they are struggling.

The goal of this project is to design a online learning platform with adaptive learning support features. The adaptive learning will focus on automatically generating practice quizzes and tests that respond to how the student struggles. The system will use completed assignments, lessons, quizzes, and instructor feedback to identify skills or concepts where the student is struggling. Once identified practice quizzes and tests will be generated that provide reference and explanations directly from the provided lesson or book when the student answers incorrectly. This system can then provide feedback to the instructor for each student and where they are struggling. This method will reinforce weak topics and build confidence in students without requiring intervention from an outside source.

The main users of this platform will be the Students who are learning and receive personalized content; Instructors who are managing the course and monitoring students’ progress; and Administrators who will be overseeing the content on the platform adjusting it for future use.

Most online Universities have hundreds or even thousands of students at a time. The system would need to be cloud-deployable, secure, scalable while also supporting AI assisted content generation. 

Business Requirements
Core Functional Requirements
BR-1: The system shall allow students to view and access course materials, lessons, readings, books, videos, discussion boards, and instructor provided content.
BR-2: The system shall allow students to complete graded assignments such as assignments, quizzes, exams, and projects.
BR-3: The system shall allow instructors to upload, organize, and manage course content.
BR-4: The system shall allow instructors to create and manage course assessments.
BR-5: The system shall have a gradebook to track student performance across all assignments.
BR-6: The system shall allow instructors to communicate with students via messages or announcements.
BR-7: The system shall allow administrators to create, update, and archive course structures.
BR-8: The system shall support user role management (student, instructor, administrator).

Adaptive Learning Requirements
BR-AL-1: The system shall analyze student graded assignments and instructor feedback.
BR-AL-2: The system shall identify specific concepts, skills, topics, or learning objectives where a student is struggling via the analysis.
BR-AL-3: The system shall automatically generate personalized practices quizzes and tests tailored to the students struggling areas.
BR-AL-4: The system shall generate explanations and reference links for each incorrectly answered question using instructor provided content and course material.
BR-AL-5: The system shall display feedback and reference material immediately after answering a question incorrectly.
BR-AL-6: The system shall provide a dashboard for instructors that displays data on where individual learners and the class as a whole are struggling.
BR-AL-7: The system shall log student usage and performance on generated practice content.

Student Requirements
BR-S-1: The system shall allow students to enroll in available classes. 
BR-S-2: The system shall allow students to track their progress across multiple courses.
BR-S-3: The system shall allow students to view grades and instructor feedback.
BR-S-4: The system shall students to request more AI generated practice sessions at any time.
BR-S-5: The system shall allow students to bookmark lessons or book pages for review.
BR-S-6: The system shall now allow students to edit or modify course content or AI content.

Instructor Requirements
BRI-1: The system shall allow instructors to view student performance, including areas the student is struggling in.
BR-I-2: The system shall allow instructors to modify course content ranging from readings, assignments, exams, projects, and AI generated explanations.
BR-I-3: The system shall allow instructors to review AI generated practice quizzes and tests and optionally refine them before approval.
BR-I-4: The system shall allow instructors to send announcements or messages directly to specific students or group of students.
BR-I-5: The system shall allow instructors to view analytics that identify classroom wide struggles per subject and assignments.
BR-I-6: The system shall not allow instructors to view private data unrelated to academic performance.
BR-I-7: The system shall not allow instructors to alter student profile information.

Administrator Requirements
BR-A-1: The system shall allow administrators to manage user accounts and roles.
BR-A-2: The system shall allow administrator to create and edit course catalogs, academic terms, and program structure.
BR-A-3: The system shall allow administrators to configure system wide settings for AI usage.
Reporting Requirements
BR-R-1: The system shall provide a dashboard for students, instructors, and administrators to display progress, grades, and AI results.
BR-R-2: The system shall provide instructors with analytics showing students engagement, completion status, and common areas of struggles.
BR-R-3: The system shall allow instructors to download or export gradebooks and AI content results.
Security Requirements:
BR-SEC-1: The system shall require secure authentication for all users.
BR-SEC-2: The system shall restrict access to content based on user role, course enrollment, and date.
BR-SEC-3: The system shall encrypt user data.
BR-SEC-4: The system shall not expose student performance to other students or unauthorized users.
BR-SEC-5: The system shall not store passwords in plain text.
AI Content Requirements
BR-AI-1: The system shall allow the AI to view students graded assignments.
BR-AI-2: The system shall allow the AI to generate practice quizzes and tests based on student performance.
BR-AI-3: The system shall not replace graded assessments with AI practice results.
BR-AI-4: The system shall not generate practice content using external sources not approved by the instructor.

Non-Functional Requirements (NFR)
Performance and Scalability
NFR-PS-1: The system shall support a minimum of 10,000 concurrent student sessions without performance degradation.
NFR-PS-2: Page loads and UI interactions shall respond within 3 seconds.
NFR-PS-3: Adaptive learning engine shall generate AI based practice content in less than 6 seconds on average.
NFR-PS-4: The system shall allow scaling of application servers and databases to support increasing number of users.
NFR-PS-5: The system shall support dynamic load balancing to distribute cloud resources.
Security and Privacy
NFR-SP-1: The system shall encrypt sensitive data (AES 256 or equivalent).
NFR-SP-2: The system shall use secure, hashed passwords (Argon2 or equivalent).
NFR-SP-3: The system shall enforce authenticated access for all users via a secure protocol (HTTPS/TLS 1.2 or above).
NFR-SP-4: The system shall comply with standard educational privacy protections (FERPA).
Reliability
NFR-R-1: The system shall maintain 99.5% uptime annually, excluding scheduled maintenance.
NFR-R-2: User data shall be backed up at least once every 24 hours.
NFR-R-3: The system shall provide automated failover in the event of hardware or node failure.
NFR-R-4: The system shall recover from critical failures within 10 minutes using redundancy and backup services.
Maintainability
NFR-M-1: Maintenance downtime shall not exceed 8 hours per month.
NFR-M-2: Code shall follow SOLID and modular design principles.
Usability and Accessibility
NFR-UA-1: The system shall support accessibility options like text to voice.
NFR-UA-2: Students shall be able to navigate through course modules using no more than 3 clicks from the dashboard.
NFR-UA-3: Platform should support multiple languages without requiring redesign of the interface.
Data Integrity
NFR-D-1: Deleted content and student data must be archived for 90 days before permanent removal.
NFR-D-2: The system shall ensure grades, records, and analytic data is consistent across all services and databases.
Interoperability and Integration
NFR-I-1: The system shall support importing and exporting reports in standard formats (csv, pdf, xlsx).
NFR-I-2: The AI module shall be replaceable without requiring major changes to the course interfaces or content.
NFR-I-3: The AI adaptive module shall communicate using a standard service interface (JSON OVER HTTPS).
