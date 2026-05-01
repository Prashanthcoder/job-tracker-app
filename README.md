# JobTrack

JobTrack is a Java-based web application designed to manage and track job applications efficiently. It provides a simple interface to add, view, and delete job entries, with persistent storage using MySQL.

## Tech Stack

![Java](https://img.shields.io/badge/Java-ED8B00?style=flat&logo=java&logoColor=white)
![Spring MVC](https://img.shields.io/badge/Spring%20MVC-6DB33F?style=flat&logo=spring&logoColor=white)
![Hibernate](https://img.shields.io/badge/Hibernate-59666C?style=flat&logo=hibernate&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)
![JSP](https://img.shields.io/badge/JSP-323330?style=flat)
![Maven](https://img.shields.io/badge/Maven-C71A36?style=flat&logo=apachemaven&logoColor=white)

## Features

- Add job applications with details such as company name, role, date, status, description, and application type  
- View all job applications in a structured format  
- Delete job applications  
- Persistent storage using MySQL  

## Screenshots

Example:

<img width="1920" height="1080" alt="Screenshot (5)" src="https://github.com/user-attachments/assets/7bd1db7f-46ef-4f5e-95ea-0b96845ef486" />
<img width="1920" height="1080" alt="Screenshot (6)" src="https://github.com/user-attachments/assets/44db93c7-89ac-4b0f-bd8e-9c769c3469b4" />


## Project Structure

- `dto` – Entity classes  
- `dao` – Data access logic using Hibernate  
- `controller` – Request handling with Spring MVC  
- `webapp` – JSP files for the user interface  

## Architecture

The application follows the MVC (Model-View-Controller) pattern:

- Model: Represents application data using entity classes  
- View: JSP pages render the UI  
- Controller: Handles requests and coordinates between view and data layer  

Hibernate is used to map Java objects to database tables and perform CRUD operations.

## Getting Started

### Prerequisites

- Java (JDK 8 or above)  
- Maven  
- MySQL  
- Apache Tomcat  

### Setup

1. Clone the repository  
git clone <https://github.com/Prashanthcoder/job-tracker-app/>


2. Configure the database  
- Create a MySQL database  
- Update connection details in `persistence.xml`  

3. Build the project
mvn clean install


4. Deploy on Tomcat  
- Add the project to the server  
- Start the server  

5. Access the application
   http://localhost:8080/JobTracker/

   
## Learning Outcomes

- Understanding of Spring MVC request lifecycle  
- Hands-on experience with Hibernate ORM and JPA  
- Building dynamic web pages using JSP  
- Applying DAO pattern for clean architecture  
- Integrating Java applications with MySQL  

## Future Improvements

- Add update/edit functionality  
- Improve UI styling  
- Introduce a service layer  
- Migrate to Spring Boot with REST APIs  
- Add authentication and user management  

## License

This project is intended for learning and educational purposes.
