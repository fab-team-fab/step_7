-- this bunch of code must be executed in postgreSQL shell

BEGIN;

--
-- Create User table
--
CREATE TABLE "user" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "name" varchar(200) NOT NULL, 
    "lname" varchar(300) NOT NULL, 
    "email" varchar(254) NOT NULL, 
    "phoneNumber" integer NOT NULL, 
    "gender" varchar(10) NOT NULL, 
    "birthday_date" datetime NOT NULL, 
    "location" varchar(40) NOT NULL, 
    "age" integer NOT NULL
);

--
-- Create Story table 
--
CREATE TABLE "story" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "story_date" datetime NOT NULL, 
    "story_content" varchar(100) NOT NULL, 
    "highlight" bool NOT NULL, 
    "user_id" integer NOT NULL REFERENCES "user" ("id") DEFERRABLE INITIALLY DEFERRED
);

--
-- Create Post table 
--
CREATE TABLE "post" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "post_date" datetime NOT NULL, 
    "post_content" varchar(100) NOT NULL, 
    "likes" integer NOT NULL, 
    "likers" text NOT NULL, 
    "user_id" integer NOT NULL REFERENCES "user" ("id") DEFERRABLE INITIALLY DEFERRED
);

--
-- Create Comment table 
--
CREATE TABLE "comment" (
    "id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, 
    "user_id" varchar(100) NOT NULL, 
    "comment_date" datetime NOT NULL, 
    "comment_content" text NOT NULL, 
    "likes" integer NOT NULL, 
    "likers" text NOT NULL, 
    "post_id" integer NOT NULL REFERENCES "post" ("id") DEFERRABLE INITIALLY DEFERRED
);

CREATE INDEX "story_user_id_d2b5c03d" ON "story" ("user_id");
CREATE INDEX "post_user_id_e1552799" ON "post" ("user_id");
CREATE INDEX "comment_post_id_60643514" ON "comment" ("post_id");

COMMIT;
