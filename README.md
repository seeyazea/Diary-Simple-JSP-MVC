# 📘 Diary Web Application  
Simple-JSP-MVC 기반으로 개발한 개인 일기 웹 애플리케이션

This project is a personal diary web application built using **JSP/Servlet MVC architecture**, allowing users to write, edit, delete diary entries, and upload images stored as **BLOB** in MySQL.  
The project was developed during an internship to practice real server-side web development with **Linux, Tomcat, and MySQL**.

---

## ✨ Features

### ✔ User Features
- Login / Logout  
- Create diary entries  
- View diary list  
- Edit entries  
- Delete entries  
- Upload images (stored in MySQL BLOB)  
- Sidebar navigation UI  

### ✔ Technical Features
- Simple-JSP-MVC clean architecture  
- DAO pattern for database access  
- Multipart image upload  
- MySQL BLOB handling  
- Linux terminal DB creation  
- JSP + Tomcat deployment  

---

## 🛠 Tech Stack

| Category | Technology |
|---------|------------|
| **Backend** | Java, Servlet, JSP |
| **Database** | MySQL (BLOB storage) |
| **Server** | Apache Tomcat 9 |
| **Frontend** | JSP, HTML, CSS |
| **OS** | Linux (Ubuntu) |
| **Tools** | Eclipse IDE |
| **Architecture** | Simple JSP MVC |

## 📂 Project Structure

```
Simple-JSP-MVC/
├── src/
│   ├── com.tirmizee.mvc.controller/     # Controller classes
│   ├── com.tirmizee.mvc.service/        # Service layer
│   ├── com.tirmizee.mvc.dao/            # DAO interfaces & implementations
│   ├── com.tirmizee.mvc.model/          # Data models
│   └── com.tirmizee.db.config/          # DBUtil (MySQL connection)
│
├── WebContent/
│   ├── WEB-INF/
│   │   ├── views/
│   │   │   ├── login.jsp
│   │   │   ├── dashboard.jsp
│   │   │   ├── diary/
│   │   │   │   ├── list.jsp
│   │   │   │   ├── write.jsp
│   │   │   │   └── edit.jsp
│   │   └── components/
│   │       └── sidebar.jsp
│
│   ├── styles/                           # CSS files
│   └── uploads/                          # (optional) local image storage
│
└── README.md
```
## 🧩 MVC Architecture Overview
```
Client
↓
Controller → Service → DAO → Database
↓
View (JSP)
```
---
## 🗄 Database Schema (Logical ERD)
```
User
id (PK)
username
password
created_at

Diary
id (PK)
user_id (FK → User.id)
title
content
image (BLOB)
created_at
```
---

## 📸 Screenshots  
(*Upload your images into `/screenshots` folder and update the links below.*)

---

## 🚀 How to Run the Project Locally

### 1️⃣ Clone the repository
```bash
git clone https://github.com/your-username/diary-project.git

2️⃣ Import into Eclipse
File → Import → Existing Dynamic Web Project

3️⃣ Configure MySQL Database
Run the SQL commands:
CREATE DATABASE diarydb;

USE diarydb;

CREATE TABLE user (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(100),
  password VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE diary (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  title VARCHAR(255),
  content TEXT,
  image LONGBLOB,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES user(id)
);

4️⃣ Configure DBUtil.java
private static final String URL = "jdbc:mysql://localhost:3306/diarydb?serverTimezone=UTC";
private static final String USER = "root";
private static final String PASS = "YOUR_PASSWORD";

5️⃣ Run on Tomcat
Right-click project → Run As → Run on Server → Tomcat 9
```

🧪 Testing Checklist

 Login works

 Create diary entry

 Upload image → saved as BLOB

 Edit & delete entry

 Dashboard shows entries

 Sidebar works
