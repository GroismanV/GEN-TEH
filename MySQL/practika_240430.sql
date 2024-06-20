CREATE DATABASE social_network;
USE social_network;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE IF NOT EXISTS posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    content TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE reactions (
    reaction_id INT AUTO_INCREMENT PRIMARY KEY,
    post_id INT,
    user_id INT,
    reaction_type ENUM('like', 'dislike') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (fullname, email)
VALUES ('vlad', 'vlad@mail.ru');
INSERT INTO users (fullname, email)
VALUES ('iurii', 'iurii@mail.ru');