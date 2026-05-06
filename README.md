# JobTrack

JobTrack is a Java-based web application designed to manage and track job applications efficiently. It provides a simple interface to add, view, update, and delete job entries, with persistent storage using MySQL — now enhanced with resume upload support and AI-powered insights.

## Tech Stack

![Java](https://img.shields.io/badge/Java-ED8B00?style=flat&logo=java&logoColor=white)
![Spring MVC](https://img.shields.io/badge/Spring%20MVC-6DB33F?style=flat&logo=spring&logoColor=white)
![Hibernate](https://img.shields.io/badge/Hibernate-59666C?style=flat&logo=hibernate&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-323330?style=flat)
![Maven](https://img.shields.io/badge/Maven-C71A36?style=flat&logo=apachemaven&logoColor=white)
![OpenAI](https://img.shields.io/badge/OpenAI-412991?style=flat&logo=openai&logoColor=white)

## Features

### Core Features
- Add job applications with details such as company name, role, date, status, description, and application type
- View all job applications in a structured format
- Edit and update existing job application details
- Delete job applications
- Persistent storage using MySQL

### Resume Upload
- Upload and attach a resume (PDF or DOCX) to each job application
- View and download previously uploaded resumes directly from the application list
- Resume files are stored securely on the server with references saved in the database

### AI Insights *(Planned / In Progress)*
- **Resume Analysis** – Get AI-generated feedback on your uploaded resume, including suggestions for improvements based on the job role
- **Job Match Score** – Receive a compatibility score indicating how well your resume aligns with a specific job description
- **Interview Prep Tips** – AI-generated likely interview questions based on the role and company
- **Application Status Predictions** – Insights on application trends and follow-up recommendations
- **Cover Letter Generator** – Auto-generate a tailored cover letter draft based on the job details and your resume

## Screenshots

Example:

<img width="1920" height="1080" alt="Screenshot (5)" src="https://github.com/user-attachments/assets/7bd1db7f-46ef-4f5e-95ea-0b96845ef486" />
<img width="1920" height="1080" alt="Screenshot (6)" src="https://github.com/user-attachments/assets/44db93c7-89ac-4b0f-bd8e-9c769c3469b4" />

## Project Structure

- `dto` – Entity classes
- `dao` – Data access logic using Hibernate
- `service` – Business logic layer (introduced for AI and file handling)
- `controller` – Request handling with Spring MVC
- `webapp` – JSP files for the user interface
- `uploads/` – Directory for storing uploaded resume files

## Architecture

The application follows the MVC (Model-View-Controller) pattern:

- **Model:** Represents application data using entity classes
- **View:** JSP pages render the UI
- **Controller:** Handles requests and coordinates between view and data layer
- **Service Layer:** Handles business logic, file I/O for resume uploads, and integration with the OpenAI API for AI insights

Hibernate is used to map Java objects to database tables and perform CRUD operations.

## Getting Started

### Prerequisites

- Java (JDK 8 or above)
- Maven
- MySQL
- Apache Tomcat
- OpenAI API key *(for AI insights features)*

### Setup

1. Clone the repository
   ```
   git clone https://github.com/Prashanthcoder/job-tracker-app/
   ```

2. Configure the database
   - Create a MySQL database
   - Update connection details in `persistence.xml`

3. Configure resume upload directory
   - Set the upload path in `application.properties` (or equivalent config):
     ```
     upload.dir=/path/to/uploads
     ```

4. Configure AI integration *(optional)*
   - Add your OpenAI API key to the config:
     ```
     openai.api.key=YOUR_API_KEY
     ```

5. Build the project
   ```
   mvn clean install
   ```

6. Deploy on Tomcat
   - Add the project to the server
   - Start the server

7. Access the application
   ```
   http://localhost:8080/JobTracker/
   ```

## Learning Outcomes

- Understanding of Spring MVC request lifecycle
- Hands-on experience with Hibernate ORM and JPA
- Building dynamic web pages using JSP
- Applying DAO pattern for clean architecture
- Integrating Java applications with MySQL
- Handling multipart file uploads in Spring MVC
- Consuming external REST APIs (OpenAI) from a Java backend
- Introducing a service layer for separation of concerns

## Future Improvements

- Complete AI insights integration with real-time feedback
- Add authentication and user management
- Dashboard with charts showing application status breakdown
- Email reminders for follow-ups
- Export job list to PDF or CSV
- Migrate to Spring Boot with REST APIs
- Improve UI styling with a modern frontend framework

## License

This project is intended for learning and educational purposes.
