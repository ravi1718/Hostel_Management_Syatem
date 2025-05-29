# College Fee Management System

*Subject Name*: Advanced Java    
*Name*: Ravitej C Neeli 
<br>
*USN*: 4AL22CS118

<br>
<br>
## 🛠 Technologies Used

- Java (JSP/Servlet)
- HTML, CSS
- JDBC
- Apache Tomcat (recommended)
- Eclipse IDE (configured with project settings)
<br>
<br>
## 🚀 Features

- **Add New Student:** Register students with admission details, room, and fee status.
- **Update Student Info:** Modify existing student data.
- **Delete Student Record:** Remove students who have checked out.
- **View Student Details:** List all students or filter by ID.
- **Reports:**
  - Students with pending fees
  - Students in a particular room
  - Students admitted within a specific date range
<br>
<br>

## 📂 Project Structure

```
HostelWebApp/
├── WebContent/
│ ├── index.jsp
│ ├── studentadd.jsp
│ ├── studentupdate.jsp
│ ├── studentdelete.jsp
│ ├── studentdisplay.jsp
│ ├── reports.jsp
│ ├── report_form.jsp
│ └── report_result.jsp
├── src/
│ ├── com/
│ ├── dao/
│ │ └── HostelDAO.java
│ ├── model/
│ │ └── Student.java
│ └── servlet/
│ ├── AddStudentServlet.java
│ ├── UpdateStudentServlet.java
│ ├── DeleteStudentServlet.java
│ ├── DisplayStudentsServlet.java
│ ├── ReportServlet.java
│ └── ReportCriteriaServlet.java
└── WEB-INF/
└── web.xml
```

<br>
<br>

## 🗄 Database Setup :

### 1. Create Database :
 ```-> sql :-

CREATE DATABASE IF NOT EXISTS hosteldb;
USE hosteldb;
```

### 2. Create Table :
 ```-> sql :-
CREATE TABLE HostelStudents (
  StudentID INT PRIMARY KEY,
  StudentName VARCHAR(100),
  RoomNumber VARCHAR(10),
  AdmissionDate DATE,
  FeesPaid DECIMAL(10,2),
  PendingFees DECIMAL(10,2)
);
```
<br>
<br>

## ⚙ Installation & Setup :

### Step 1: Clone/Download the Project;
Download all the project files and organize them based on the MVC project structure (Model, View, Controller, WEB-INF, etc.).

### Step 2: Database Configuration :
1. Start your MySQL or XAMPP server.
2. Run the SQL script provided above to create the database and table:
3. Update the DB connection in ReservationDAO.java:
   java
   connection = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hosteldb", 
    "your_username", 
    "your_password");
   

### Step 3: Add MySQL JDBC Driver :
1. [Download MySQL Connector/J](https://dev.mysql.com/downloads/connector/j/) from the official MySQL website.
2. Add the downloaded JAR file to your project’s WEB-INF/lib directory.
3. If using an IDE like Eclipse or IntelliJ, add it to your build path.

### Step 4: Deploy to Tomcat :
1. Create a Dynamic Web Project in your IDE (Eclipse recommended).
2. Import all your Java source files, JSPs, and web resources.
3. Deploy the project on Tomcat (version 9.0 or higher).
4. Start the Tomcat server.

### Step 5: Access the Application :
Open your browser and go to:

http://localhost:8080/HostelManagementSystem/

This will open your homepage with modules like Add Fee payment, Update payment, delete payment, 
display payment, and Generate Reports — as seen in the UI.

<br>
<br>

## 📸 Screenshots

The Output/ folder contains screenshots of the application UI including:

### 🔹 Front Page -
![Front Page](https://github.com/ravi1718/Hostel_Management_Syatem/blob/main/output/frontpage.jpg)

## Add Student
![Add student](https://github.com/ravi1718/Hostel_Management_Syatem/blob/main/output/addstudent.jpg)

## display Students
![display student](https://github.com/ravi1718/Hostel_Management_Syatem/blob/main/output/displaystudents.jpg)

## Update Student
![update student](https://github.com/ravi1718/Hostel_Management_Syatem/blob/main/output/updatestudenta.jpg)

## Delete Student
![delete student](https://github.com/ravi1718/Hostel_Management_Syatem/blob/main/output/deletestudent1.jpg)

## Report Generation
![report_generation_form](https://github.com/ravi1718/Hostel_Management_Syatem/blob/main/output/studentreportfrom.jpg)
![report_generation_result](https://github.com/ravi1718/Hostel_Management_Syatem/blob/main/output/studentreportresult.jpg)
<br>
<br>

## 🚀 Getting Started

### Prerequisites

- Java JDK 8 or higher
- Apache Tomcat 9+
- MySQL or other JDBC-compatible database
- Eclipse IDE for Enterprise Java Developers

### Setup Instructions

1. Clone or download the repository.
2. Import the project into Eclipse as an existing Java project.
3. Configure the project build path and server runtime (Tomcat).
4. Create the database and table as required.
5. Update your DB connection settings in DBConnection.java.
6. Deploy the project on Tomcat and run.

--------------->THANK YOU<-------------