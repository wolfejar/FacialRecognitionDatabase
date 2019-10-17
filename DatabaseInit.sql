CREATE DATABASE IF NOT EXISTS FacialRecognitionApp;
USE FacialRecognitionApp;
SHOW databases;

DROP TABLE IF EXISTS ModelUserClassification;
DROP TABLE IF EXISTS AppUser;
DROP TABLE IF EXISTS Model;

CREATE TABLE IF NOT EXISTS Model (
	ModelId int not null auto_increment,
    PRIMARY KEY (ModelId)
);

CREATE TABLE IF NOT EXISTS AppUser (
	UserId int not null auto_increment,
    HomeUserId int,
    UserName varchar(64) not null unique,
    FirstName varchar(64) not null,
    LastName varchar(64) not null,
    Role varchar(64) not null,
    /* for guest user, this will be same as password for home user */
    HashedPassword varchar(256) not null,
    PRIMARY KEY (UserId)
);

CREATE TABLE IF NOT EXISTS ModelUserClassification (
	ClassificationId int not null auto_increment,
	UserId int not null,
    ModelId int not null,
    IsTrainClassification bool not null,
    ClassificationTimestamp timestamp,
    ImagePath varchar(1024) not null,
    Confidence double not null,
    primary key (ClassificationId),
    foreign key(UserId) references AppUser(UserId),
    foreign key(ModelId) references Model(ModelId)
);

select * from AppUser;