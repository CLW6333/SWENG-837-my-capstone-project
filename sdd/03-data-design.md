Skeleton Class Definition
User (Abstract)
public abstract class User {
    protected String userId;
    protected String name;
    protected String email;

    public boolean login(String email, String password) { /* ... */ }
    public void logout() { /* ... */ }
}
Student Concept Mastery
public class StudentConceptMastery {
    private Student student;
    private Concept concept;
    private double masteryLevel; // 0.0 - 1.0
    private Date lastUpdated;

    public void updateLevel(double newLevel) { /* ... */ }
}
Practice Session
public class PracticeSession {
    private String sessionId;
    private Student student;
    private Course course;
    private Date startedOn;
    private String status; // Created, Ready, InProgress, Completed, Expired
    private List<PracticeQuestion> practiceQuestions;

    public void addPracticeQuestion(PracticeQuestion pq) { /* ... */ }
    public double calculateScore() { /* ... */ }
    public boolean hasNext() { /* ... */ }
}
Adaptive Practice Service (Service Class)
public class AdaptivePracticeService {

    public PracticeSession generatePracticeSession(Student student, Course course) {
        /* gather performance + mastery, call AI, build session */
    }

    public void submitPracticeAnswer(String sessionId, String questionId, String answer) {
        /* load session & question, evaluate, update mastery, call AI for explanation */
    }
}

Attempt
public class Attempt {
    private String attemptId;
    private Assessment assessment;
    private Student student;
    private Date attemptDate;
    private double score;
    private boolean isGraded;
}
Database Definitions  
Users
Column	Type	Key	Notes
user_id	VARCHAR(50)	PK	Unique user ID
name	VARCHAR(100)		Full name
Email	VARCHAR(100)	UNIQUE	Login email
Role	VARCHAR(20)		Student; instructor; Admin
Student Concept Mastery
Column	Type	Key	Notes
user_id	VARCHAR(50)	PK, FK(user_id)	Student
Concept_id	VARCHAR(50)	PK, FK (concept_id)	
Master_level	DECIMAL(3,2)		0.00-1.00
Changeddate	DATETIME		


Practice Session
Column	Type	Key	Notes
Session_id	VARCHAR(50)	PK	
user_id	VARCHAR(50)	FK(user_id)	Student
course_id	VARCHAR(50)	FK(course_id)	Course
Startdate	DATETIME		
status	VARCHAR(20)		Created, Ready, InProgress, Completed, Removed

Practice Questions
Column	Type	Key	Notes
Pq_id	VARCHAR(50)	PK	Unique practice question ID
Session_id	VARCHAR(50)	FK (session_id)	
question_id	VARCHAR(50)	FK(question_id)	Base question
Student_answer	TEXT		Answer given by the student
Is_correct	BOOLEAN		Is given answer correct Y/N

