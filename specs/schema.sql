-- schema.sql
-- Database schema for Online Learning Platform with Adaptive Practice

-- USERS
CREATE TABLE users (
    user_id           UUID PRIMARY KEY,
    email             VARCHAR(255) NOT NULL UNIQUE,
    full_name         VARCHAR(255) NOT NULL,
    role              VARCHAR(32) NOT NULL, -- STUDENT, INSTRUCTOR, ADMIN
    created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- COURSES
CREATE TABLE courses (
    course_id         UUID PRIMARY KEY,
    course_code       VARCHAR(64) NOT NULL,
    title             VARCHAR(255) NOT NULL,
    term              VARCHAR(64),
    created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ENROLLMENTS (Student and Instructor enrollments in Courses)
CREATE TABLE enrollments (
    enrollment_id     UUID PRIMARY KEY,
    user_id           UUID NOT NULL,
    course_id         UUID NOT NULL,
    enrolled_role     VARCHAR(32) NOT NULL,  -- STUDENT or INSTRUCTOR
    enrolled_at       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_enroll_user
        FOREIGN KEY (user_id) REFERENCES users (user_id),
    CONSTRAINT fk_enroll_course
        FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

-- CONCEPTS (skills / topics per course)
CREATE TABLE concepts (
    concept_id        UUID PRIMARY KEY,
    course_id         UUID NOT NULL,
    name              VARCHAR(255) NOT NULL,
    description       TEXT,
    CONSTRAINT fk_concept_course
        FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

-- STUDENT CONCEPT MASTERY
CREATE TABLE student_concept_mastery (
    mastery_id        UUID PRIMARY KEY,
    student_id        UUID NOT NULL,
    concept_id        UUID NOT NULL,
    mastery_level     NUMERIC(3,2) NOT NULL, -- 0.00 to 1.00
    last_updated      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_mastery_student
        FOREIGN KEY (student_id) REFERENCES users (user_id),
    CONSTRAINT fk_mastery_concept
        FOREIGN KEY (concept_id) REFERENCES concepts (concept_id)
);

-- PRACTICE SESSIONS
CREATE TABLE practice_sessions (
    session_id        UUID PRIMARY KEY,
    student_id        UUID NOT NULL,
    course_id         UUID NOT NULL,
    status            VARCHAR(32) NOT NULL, -- CREATED, READY, IN_PROGRESS, COMPLETED, EXPIRED
    started_on        TIMESTAMP,
    completed_on      TIMESTAMP,
    total_questions   INTEGER NOT NULL DEFAULT 0,
    correct_count     INTEGER NOT NULL DEFAULT 0,
    created_at        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_session_student
        FOREIGN KEY (student_id) REFERENCES users (user_id),
    CONSTRAINT fk_session_course
        FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

-- PRACTICE QUESTIONS
CREATE TABLE practice_questions (
    question_id           UUID PRIMARY KEY,
    practice_session_id   UUID NOT NULL,
    concept_id            UUID NOT NULL,
    position_index        INTEGER NOT NULL,
    question_text         TEXT NOT NULL,
    correct_answer        TEXT NOT NULL,
    explanation           TEXT,
    reference_url         TEXT,
    student_answer        TEXT,
    is_correct            BOOLEAN,
    created_at            TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_pq_session
        FOREIGN KEY (practice_session_id) REFERENCES practice_sessions (session_id),
    CONSTRAINT fk_pq_concept
        FOREIGN KEY (concept_id) REFERENCES concepts (concept_id)
);

-- Optional indexes for performance
CREATE INDEX idx_enrollments_user ON enrollments (user_id);
CREATE INDEX idx_enrollments_course ON enrollments (course_id);
CREATE INDEX idx_mastery_student ON student_concept_mastery (student_id);
CREATE INDEX idx_mastery_concept ON student_concept_mastery (concept_id);
CREATE INDEX idx_sessions_student_course ON practice_sessions (student_id, course_id);
CREATE INDEX idx_pq_session ON practice_questions (practice_session_id);
