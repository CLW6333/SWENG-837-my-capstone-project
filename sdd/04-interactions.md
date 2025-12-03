USE Case Diagram
 
Figure 1: Use Case Diagram – Online Learning Platform with Adaptive Practice (Use Case Diagram.png)

Figure 1 Description

Figure 1 displays all the major actors in the system with functional interactions for each. The three primary actors that interact with the system are: Students, Instructors, and Administrators. Students can access course content, view grades and instructor feedback, and take assessments. If needed they can request adaptive practice sessions to then take ai generated practice content. Instructors manage course content and assessments while viewing student performance and struggle areas. They are also able to use analytics to review adaptive practice information. Administrators on the other hand manage users and assign roles that determine what content they can view. They are able to edit and create new courses in the catalog while adding or removing content for those courses. System wide settings for the adaptive Practice AI system are configured by the Administrators.

An external AI practice service generates personalized practice questions with related explanations based on the student performance data. The students can view these explanations while taking practice quizzes and tests. As the generated practice material is made separately from the main course content this ensures the adaptive practice results do not alter the students grades. The Take AI generated material use case includes a dependency on Generate practice questions and explanations indicating dynamically created content rather than pre made ones. Having view explanations as a necessary next step after taking practice assessments reinforces learning by seeing the explanations for incorrect responses.

Sequence Diagrams

Sequence Diagram 1 (Sequence Diagram #1 - request adaptive practice session(synchronous).png)
 
Figure 4: Sequence Diagram – Request Adaptive Practice Session (Synchronous)

Sequence Diagram 1 Description

This sequence shows the flow of when a student requests adaptive practice session for a specific course. Starting with the Student selecting “Request Practice” option in the Web UI. The UI sends this request to the AdaptivePracticeService that in real time coordinates the generation of personalized practice content.

The service queries the CourseService for the overall progress of the Student followed by the AssessmentService to get the graded history in the course. The service will then consult the StudentConceptMastery Repository to determine areas of weakness. This repository has information derived from prior attempts and graded results. Using all this combined information the service determines what the weak concepts that need to be targeted are in the practice session.

An external AI Practice Service is called synchronously using the weak concepts as an input. The AI service should then create templates of practice questions for those inputs. The AdaptivePracticeService creates a new PracticeSession populating the templates with practice questions. This practice session is then created and stored for the Student with a summary of what concepts are involved, question count, and details of what was being targeted. Immediately after storing the information the UI displays the first practice question to the Student. Students will only have to wait briefly while the session is generated and can begin practicing as soon as the generation is complete.

Sequence Diagram 2
  
Figure 5: Sequence Diagram #2 – Complete AI-Generated Practice Quiz/Test (Sequence diagram#2 - complete ai-generated practice quiz.png)

Sequence Diagram 2 Description

This sequence starts when the Student submits an answer to a practice questions through the UI. Submitting a answer sends a request to the AdaptivePracticeService that retrieves data from the PracticeSession and cooresponding Question from their respective repositories. The service evaluates the answer using the validateAnswer() operation on the question. The students response is recorded and stored in the PracticeQuestion record along with if it was correct or not. Using this response the service then gets a list of concepts linked to the question to update the StudentConceptMastery Repository based on the students mastery level of those concepts. 

The service then calls the external AI Practice Service to create a explanation with reference links based on the students response. The reference links and explanations are based on instructor approved material to help the student study the correct information. After resolving the question the service checks if there are additional practice questions that remain in the session by communicating with the PracticeSession Repository. If more questions remain it repeats the process of determining if the question was correct or not then providing explanations. If all questions in a session are complete a session summary including overall performance and concept level feedback is provided via the UI.
State Diagram
 
Figure 6: PracticeSession State Diagram (practice session state diagram.png)

State Diagram Description

A practice session is created when a student requests adaptive practice for a specific course. When in the Created state the session is associated with the specific student and course. At this point no templates or questions are created. From here the state moves to GeneratingQuestions where the AI practice service is called to produce the concept targeted questions. If the User cancels the generation the session immediately moves to the Cancelled state.
While in the GenerationQuestions state the session waits for the AI to respond before moving to the Ready state. In the case that generation fails the state is moved to Failed. In the Ready state questions have been generated and associated to the session for the student. The state does not change again until the student interacts with the first question by answering it moving it to the InProgress state.

The InProgress state students can answer one or more questions or pause and resume later (moves to Pause state going back to InProgress when continuing). When all questions are answer the state moves to Completed where the system calculates the score of the question while updating the student mastery on the concepts. Practice sessions are timed meaning if a student does not begin or continue a paused session it can move to the expired state.
Activity Diagram
 
Figure 7: Activity Diagram (activity diagram.png)

Activity Diagram Description

This swimlane diagram shows the end to end process for a student completing a adaptive practice session. Ther are four lanes in this diagram: Student, Web UI, AdaptivePracticeService, and AIPracticeService. The process begins when a student requests practice for a specific course. The request is forwarded by the web UI to the AdaptivePracticeService that uses the students assessment history and current course progress to identify weak spots. The AdaptivePracticeService calls the AIPracticeService to generate the concept targeted practice questions.

When the AI service returns the generated questions the Adaptive service creates a new PracticeSession with the first generated question sent to the UI to display to the student. After this point the diagram will enter a loop where the student repeatedly submits answers to the questions. Each answer given the Web UI passes the answer to the AdaptivePracticeService loading the relevant session and question then comparing the students answer to the correct answer while updating the PracticeQuestion record. Depending on the answer the concept mastery for the student and course is updated before calling the AI Service to provide explanations and references for incorrect answers. Relevant information like feedback, explanation, next question, or practice summary is sent back to the UI so the student can review them.

The loop will continue so long as any questions remain unanswered. After the last question is answered the Adaptive service returns a final summary on the overall performance and concept feedback. The activity itself is finalized when the student reviews the result.
