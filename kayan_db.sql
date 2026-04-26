-- إنشاء قاعدة البيانات
CREATE DATABASE IF NOT EXISTS kayan_db;
USE kayan_db;

-- جدول المستخدمين
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255),
    role ENUM('admin','specialist'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- جدول الزوار
CREATE TABLE visitors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    job_title VARCHAR(100),
    job_number VARCHAR(50),
    password VARCHAR(255) DEFAULT '12345',
    first_login BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- سجل الزوار
CREATE TABLE visitor_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    visitor_id INT NULL,
    visit_type ENUM('تقييمي','استطلاعي'),
    notes TEXT,
    visit_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (visitor_id) REFERENCES visitors(id) ON DELETE CASCADE
);

-- جدول الحالات
CREATE TABLE cases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100),
    grade VARCHAR(50),
    issue_type VARCHAR(100),
    description TEXT,
    status ENUM('جديدة','قيد المتابعة','مغلقة') DEFAULT 'جديدة',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- جدول الجلسات
CREATE TABLE sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    case_id INT,
    session_date DATE,
    notes TEXT,
    recommendations TEXT,
    FOREIGN KEY (case_id) REFERENCES cases(id) ON DELETE CASCADE
);

-- إدخال مستخدم افتراضي (كلمة المرور: 12345 مشفرة)
INSERT INTO users (full_name, username, password, role)
VALUES (
'حمدة العمرية',
'admin',
'$2y$10$wH8QeX5ZyYz3Gk1yZl7Q3uQvQ6rj9Xz6xJ5p0VhYwHc8Kz1m7Qz8a',
'admin'
);