-- Initiating the transaction between the database --

START TRANSACTION;

-- Drop table if exists so that we can start from scratch --
DROP TABLE IF EXISTS posts, users, comments;

-- CREATE TABLE USERS --
CREATE TABLE users (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 username VARCHAR(50) NOT NULL,
 email VARCHAR(100) NULL DEFAULT 'N/A',
 password VARCHAR(255) NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CREATE TABLE POSTS --
CREATE TABLE posts (
 id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 user_id INT NOT NULL REFERENCES users(id),
 title VARCHAR(100) NOT NULL,
 content TEXT NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CREATE TABLE COMMENTS --
CREATE TABLE comments (
 comment_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 user_id INT NOT NULL REFERENCES users(id),
 post_id INT NOT NULL REFERENCES posts(id),
 text_content TEXT NOT NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- INSERTING VALUES INTO USERS, POSTS AND COMMENTS --
INSERT INTO users (username, email, password) VALUES ('alice', 'alice@test.com', 'password123'),
 ('bob', 'bob@test.com', 'password456'),('charlie', 'charlie@test.com', 'password789');

INSERT INTO posts (user_id, title, content) VALUES (1, 'FirstPost', 'This is the content of the first post'),
(2, 'Second Post', 'This is the content of the second post'), (3, 'Third Post', 'This is the content of the third post'),
(1, 'Fourth Post', 'This is the content of the fourth post'),(2, 'Fifth Post', 'This is the content of the fifth post');


INSERT INTO comments(user_id,post_id,text_content) VALUES(1, 1, 'I love icecreams'),
(2,2,'Hello all, hows the weather?');

-- COMMITTING THE TRANSACTION SO THAT THE RECORDS PERSIST ---
COMMIT;