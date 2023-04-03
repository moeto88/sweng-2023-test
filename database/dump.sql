
BEGIN;
set constraints all deferred;

CREATE TABLE categories (
	"categoryId" INTEGER NOT NULL, 
	"categoryName" VARCHAR NOT NULL, 
	PRIMARY KEY ("categoryId")
);
CREATE TABLE tags (
	"tagId" INTEGER NOT NULL, 
	"tagName" VARCHAR NOT NULL, 
	"tagNameShort" VARCHAR NOT NULL, 
	"categoryId" INTEGER, 
	PRIMARY KEY ("tagId"), 
	FOREIGN KEY("categoryId") REFERENCES categories ("categoryId")
);

CREATE TABLE users (
	email VARCHAR(255) NOT NULL, 
	username VARCHAR, 
	id uuid NOT NULL, 
	created_at timestamp NOT NULL, 
	updated_at timestamp NOT NULL, 
	hashed_password VARCHAR, 
	password_version INTEGER NOT NULL, 
	is_active BOOLEAN NOT NULL, 
	role INTEGER NOT NULL, 
	PRIMARY KEY (id)
);
CREATE TABLE projects (
	title VARCHAR NOT NULL, 
	link VARCHAR NOT NULL, 
	description VARCHAR NOT NULL, 
	content VARCHAR NOT NULL, 
	date timestamp NOT NULL, 
	id uuid NOT NULL, 
	is_live BOOLEAN NOT NULL, 
	user_id uuid NOT NULL, visit_count integer default 0, is_featured boolean default false, 
	PRIMARY KEY (id), 
	FOREIGN KEY(user_id) REFERENCES users (id)
);

CREATE TABLE project_tags (
	project_id uuid NOT NULL, 
	tag_id INTEGER NOT NULL, 
	PRIMARY KEY (project_id, tag_id), 
	FOREIGN KEY(project_id) REFERENCES projects (id) ON DELETE CASCADE, 
	FOREIGN KEY(tag_id) REFERENCES tags ("tagId") ON DELETE CASCADE
);

INSERT INTO categories VALUES(1,'Programming Languages');
INSERT INTO categories VALUES(2,'Sponsor');

INSERT INTO tags VALUES(1,'Python','py',1);
INSERT INTO tags VALUES(2,'Java','java',1);
INSERT INTO tags VALUES(3,'C++','cpp',1);
INSERT INTO tags VALUES(11,'Trinity','Trinity',2);
INSERT INTO tags VALUES(12,'IBM','IBM',2);

INSERT INTO users VALUES('sus1@tcd.ie','string','ea1964dcd0bb4c959666bae528db2a4f','2023-03-01 22:05:31.492154','2023-03-01 22:21:15.354633','$2b$12$YY9JGNOS1SqIU/nSTD4q1OFSyl7t4L9PQZkVKu6Zh87lsZPTcN4AK',1,TRUE,1);
INSERT INTO users VALUES('bob@gmail.com',NULL,'cfd748f2123341d480121ac0a0d32aad','2023-03-24 16:24:36.902368','2023-03-24 16:24:36.902368','$2b$12$zlnViCtolcMuPh3CJ3/Qy.TQZ4vowjOCwPuKEFsQ23p60EfPD0Y9.',0,TRUE,0);

INSERT INTO projects VALUES('string','string','string','string','2023-03-01 22:07:58.387000','4e1dcb9925304676b377be2da090d07d',FALSE,'ea1964dcd0bb4c959666bae528db2a4f',3,TRUE);
INSERT INTO projects VALUES('string','string','string','string','2023-03-01 22:07:58.387000','333d0f27febb4fd7a913469d0879c57a',FALSE,'ea1964dcd0bb4c959666bae528db2a4f',0,FALSE);
INSERT INTO projects VALUES('string','string','string','string','2023-03-01 22:07:58.387000','190551be832543c2b79c6138bb450b5a',FALSE,'ea1964dcd0bb4c959666bae528db2a4f',0,FALSE);
INSERT INTO projects VALUES('string','string','string','string','2023-03-01 22:07:58.387000','1f6fba5b0bf64df184a2fdc8aa5d1188',FALSE,'ea1964dcd0bb4c959666bae528db2a4f',0,FALSE);
INSERT INTO projects VALUES('string','string','string','string','2023-03-01 22:07:58.387000','f310a380a27a4a18b6b0a44ac6813fdf',FALSE,'ea1964dcd0bb4c959666bae528db2a4f',0,FALSE);

INSERT INTO project_tags VALUES('4e1dcb9925304676b377be2da090d07d',1);
INSERT INTO project_tags VALUES('4e1dcb9925304676b377be2da090d07d',2);
INSERT INTO project_tags VALUES('333d0f27febb4fd7a913469d0879c57a',1);
INSERT INTO project_tags VALUES('333d0f27febb4fd7a913469d0879c57a',3);
INSERT INTO project_tags VALUES('190551be832543c2b79c6138bb450b5a',1);
INSERT INTO project_tags VALUES('190551be832543c2b79c6138bb450b5a',2);
INSERT INTO project_tags VALUES('190551be832543c2b79c6138bb450b5a',11);
INSERT INTO project_tags VALUES('1f6fba5b0bf64df184a2fdc8aa5d1188',11);
INSERT INTO project_tags VALUES('f310a380a27a4a18b6b0a44ac6813fdf',11);

COMMIT;