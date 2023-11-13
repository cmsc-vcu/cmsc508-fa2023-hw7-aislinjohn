# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleroles;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time commitment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

drop table if exists skills;
CREATE TABLE skills(
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null DEFAULT '(default description)',
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key(skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!


insert into skills (skills_id, skills_name, skills_tag) values
  (1, 'rock climbing', 'Skill 1'),
  (2, 'mind reading', 'Skill 2'),
  (3, 'dancing', 'Skill 3'),
  (4, 'cooking', 'Skill 4'),
  (5, 'drawing', 'Skill 5'),
  (6, 'coding in commom lisp', 'Skill 6'),
  (7, 'singing', 'Skill 7'),
  (8, 'creating fire from rocks','Skill 8');




# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

drop table if exists people;
CREATE TABLE people (
    people_id int NOT NULL,
    people_last_name varchar(256) NOT NULL,
    people_first_name varchar(256),
    email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(256),
    date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.


INSERT INTO people (people_id, people_last_name, people_first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
(1, 'Person 1', 'Albert', 'albert@example.com', 'https://www.linkedin.com/albert', 'https://example.com/albert.jpg', 'Albert#1234', 'Passionate about technology', '2023-01-01'),
(2, 'Person 2', 'Bianca', 'bianca@example.com', 'https://www.linkedin.com/bianca', 'https://example.com/bianca.jpg', 'Bianca#5678', 'Enthusiastic learner', '2023-02-15'),
(3, 'Person 3', 'Charlie', 'charlie@example.com', 'https://www.linkedin.com/charlie', 'https://example.com/charlie.jpg', 'Charlie#9101', 'Creative thinker', '2023-03-30'),
(4, 'Person 4', 'Diana', 'diana@example.com', 'https://www.linkedin.com/diana', 'https://example.com/diana.jpg', 'Diana#1122', 'Aspiring professional', '2023-05-12'),
(5, 'Person 5', 'Edward', 'edward@example.com', 'https://www.linkedin.com/edward', 'https://example.com/edward.jpg', 'Edward#3344', 'Passionate about arts', '2023-06-25'),
(6, 'Person 6', 'Fiona', 'fiona@example.com', 'https://www.linkedin.com/fiona', 'https://example.com/fiona.jpg', 'Fiona#5566', 'Tech-savvy and creative', '2023-08-08'),
(7, 'Person 7', 'George', 'george@example.com', 'https://www.linkedin.com/george', 'https://example.com/george.jpg', 'George#7788', 'Experienced professional', '2023-09-20'),
(8, 'Person 8', 'Hannah', 'hannah@example.com', 'https://www.linkedin.com/hannah', 'https://example.com/hannah.jpg', 'Hannah#9900', 'Innovative thinker', '2023-10-05'),
(9, 'Person 9', 'Ian', 'ian@example.com', 'https://www.linkedin.com/ian', 'https://example.com/ian.jpg', 'Ian#1122', 'Curious and analytical', '2023-11-18'),
(10, 'Person 10', 'Jessica', 'jessica@example.com', 'https://www.linkedin.com/jessica', 'https://example.com/jessica.jpg', 'Jessica#3344', 'Passionate about design', '2023-12-01');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

drop table if exists peopleskills;
create table peopleskills( 
    id int auto_increment,
    skills_id int,
    people_id int,
    date_acquired date default(current_date),
    primary key (id),
    foreign key(skills_id) references skills (skills_id),
    foreign key(people_id) references people (people_id),
     unique(people_id,skills_id)
    );


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills (people_id, skills_id) values
(1,1),
(1,3),
(1,6),
(2,3),
(2,4),
(2,5),
(3,1),
(3,5),
(5,3),
(5,6),
(6,2),
(6,3),
(6,4),
(7,3),
(7,5),
(7,6),
(8,1),
(8,3),
(8,5),
(8,6),
(9,2),
(9,5),
(9,6),
(10,1),
(10,4),
(10,5);

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

drop table if exists roles;
create table roles(
     id int,
     name varchar(255),
     sort_priority int,
     primary key(id) 
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority) VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

drop table if exists peopleroles;
create table peopleroles(
     id int not null auto_increment,
     people_id int not null,
     role_id int not null,
     date_assigned int not null, 
    foreign key(role_id) references roles (id),
    foreign key(people_id) references people (people_id),
     
     primary key(id)
);     


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer


INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
(1, 2, UNIX_TIMESTAMP()),
(2, 5, UNIX_TIMESTAMP()),
(2, 6, UNIX_TIMESTAMP()),
(3, 2, UNIX_TIMESTAMP()),
(3, 4, UNIX_TIMESTAMP()),
(4, 3, UNIX_TIMESTAMP()),
(5, 3, UNIX_TIMESTAMP()),
(6, 2, UNIX_TIMESTAMP()),
(6, 1, UNIX_TIMESTAMP()),
(7, 1, UNIX_TIMESTAMP()),
(8, 1, UNIX_TIMESTAMP()),
(8, 4, UNIX_TIMESTAMP()),
(9, 2, UNIX_TIMESTAMP()),
(10, 2, UNIX_TIMESTAMP()),
(10, 1, UNIX_TIMESTAMP());
