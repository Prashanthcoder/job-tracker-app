# JobTrack

JobTrack is a Java-based web application designed to manage and track job applications efficiently with AI-powered insights. It provides a comprehensive interface to add, view, edit, and delete job entries, with persistent storage using MySQL and intelligent career coaching features.

## Tech Stack

![Java](https://img.shields.io/badge/Java-ED8B00?style=flat&logo=java&logoColor=white)
![Spring MVC](https://img.shields.io/badge/Spring%20MVC-7.0.6-6DB33F?style=flat&logo=spring&logoColor=white)
![Hibernate](https://img.shields.io/badge/Hibernate-6.4.4-59666C?style=flat&logo=hibernate&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.3-4479A1?style=flat&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-323330?style=flat)
![Maven](https://img.shields.io/badge/Maven-C71A36?style=flat&logo=apachemaven&logoColor=white)
![Groq API](https://img.shields.io/badge/Groq%20API-AI%20Insights-FF6B6B?style=flat)
![Jakarta EE](https://img.shields.io/badge/Jakarta%20EE-6.0-007396?style=flat)

## Features

- **User Authentication**: Secure login and signup functionality for user account management
- **Job Application Management**: Add, view, edit, and delete job applications with comprehensive details
  - Company name, role, application date, status, and description
  - Application type tracking
- **Resume Upload & Storage**: Upload and manage resume files for each job application
- **AI-Powered Career Coaching**: Get personalized insights using Groq AI
  - Interview preparation tips specific to the role
  - Key skills to highlight from job descriptions
  - Next step advice based on application status
- **ATS Score Analysis**: Evaluate resume compatibility with job descriptions
  - Score calculation (0-100)
  - Matched keywords identification
  - Missing keywords detection
  - Actionable improvement tips
- **Persistent Storage**: All data saved to MySQL database
- **Responsive UI**: Dynamic JSP-based user interface with file upload support

## Screenshots

Example:

<img width="1920" height="1080" alt="Screenshot (5)" src="https://github.com/user-attachments/assets/7bd1db7f-46ef-4f5e-95ea-0b96845ef486" />
<img width="1920" height="1080" alt="Screenshot (6)" src="https://github.com/user-attachments/assets/44db93c7-89ac-4b0f-bd8e-9c769c3469b4" />


## Project Structure

```
src/main/java/
├── com/
│   ├── configuration/      # Spring configuration and setup
│   │   └── Myconfig.java   # MVC and multipart resolver configuration
│   └── controller/
│       ├── Jobcontroller.java     # Main request handler for job operations
│       └── WebInitializer.java    # Web application initializer
├── dao/
│   └── DataAccess.java     # Data access layer with Hibernate
└── dto/
    └── JobApplication.java # Job application entity

src/main/resources/
└── META-INF/
    └── persistence.xml     # JPA/Hibernate configuration

src/main/webapp/
├── home.jsp                # Main application UI
└── WEB-INF/
    └── web.xml            # Deployment descriptor
```

## Architecture

The application follows the **MVC (Model-View-Controller)** pattern with modern Spring framework:

- **Model**: JobApplication entity mapped to database using Hibernate 6.4.4
- **View**: JSP pages render dynamic UI with form handling and file uploads
- **Controller**: Spring @Controller annotation with RequestMapping handlers
- **Data Access**: DAO pattern with Hibernate EntityManager for CRUD operations
- **External API Integration**: Groq API for AI-powered insights and ATS scoring

## API Integration

### Groq AI Integration
- **Endpoint**: `https://api.groq.com/openai/v1/chat/completions`
- **Model**: llama-3.3-70b-versatile
- **Features**:
  - Career coaching with interview preparation tips
  - ATS score analysis for resume optimization
- **Authentication**: Bearer token via `GROQ_API_KEY` environment variable

## Getting Started

### Prerequisites

- Java (JDK 11 or above) 
- Maven 3.6+
- MySQL 8.3+
- Apache Tomcat 10+ (for Jakarta EE support)
- Groq API Key (free tier available at https://console.groq.com)

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/Prashanthcoder/job-tracker-app/
   cd job-tracker-app
   ```

2. **Configure the database**
   - Create a MySQL database named `jobtracker`
   - Update connection details in `src/main/resources/META-INF/persistence.xml`
   - Example configuration:
     ```xml
     <property name="jakarta.persistence.jdbc.url" value="jdbc:mysql://localhost:3306/jobtracker"/>
     <property name="jakarta.persistence.jdbc.user" value="root"/>
     <property name="jakarta.persistence.jdbc.password" value="your_password"/>
     ```

3. **Set Groq API Key**
   ```bash
   export GROQ_API_KEY=your_groq_api_key_here
   ```

4. **Build the project**
   ```bash
   mvn clean install
   ```

5. **Deploy on Tomcat**
   - Copy `target/JobTrackerApp.war` to Tomcat's `webapps` directory
   - Start Tomcat server
   - Or use Maven plugin: `mvn tomcat7:run`

6. **Access the application**
   ```
   http://localhost:8080/JobTrackerApp/
   ```

## Key Controller Endpoints

- `GET /` - Display all job applications
- `POST /addJob` - Add new job application with resume upload
- `GET /editJob?id={id}` - Load job for editing
- `POST /updateJob` - Update existing job application
- `POST /deleteJob?id={id}` - Delete job application
- `POST /aiInsights` - Get AI career coaching insights
- `POST /atsScore` - Calculate ATS compatibility score

## Configuration Details

### Multipart File Upload
- Configured via `StandardServletMultipartResolver`
- Upload directory: `~/jobtracker_uploads/`
- File naming: `{company_name}_{original_filename}`

### View Resolution
- Prefix: `/`
- Suffix: (empty)
- JSP files served directly from webapp root

## Learning Outcomes

- Understanding of Spring MVC request lifecycle and annotations
- Hands-on experience with Hibernate 6.4.4 ORM and Jakarta Persistence API
- Building dynamic web pages using JSP with JSTL
- Implementing DAO pattern for clean architecture
- Integrating Java applications with MySQL databases
- Calling external REST APIs (Groq AI) from Java applications
- Handling file uploads and storage in Spring MVC
- User authentication and session management
- Modern Java web development with Jakarta EE

## Future Improvements

- Complete user authentication and role-based access control
- Email verification for signup
- Implement password reset functionality
- Interview tracking and scheduling
- Job market analytics and salary insights
- Resume template suggestions
- Integration with LinkedIn and job portals
- Migrate to Spring Boot 3.x with REST APIs
- Add Docker containerization
- CI/CD pipeline with GitHub Actions
- Unit and integration testing with JUnit and Mockito

## Troubleshooting

**Issue**: 404 error on resume uploads
- **Solution**: Ensure `~/jobtracker_uploads/` directory exists and is writable

**Issue**: Groq API not responding
- **Solution**: Verify `GROQ_API_KEY` environment variable is set correctly
- Check internet connectivity and API rate limits

**Issue**: Database connection failures
- **Solution**: Verify MySQL is running and persistence.xml has correct credentials
- Check JDBC URL format: `jdbc:mysql://localhost:3306/jobtracker`

## License

This project is intended for learning and educational purposes.

---

**Last Updated**: May 2026  
**Status**: Active Development
