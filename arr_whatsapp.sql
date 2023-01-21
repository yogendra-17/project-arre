CREATE DATABASE whatsapp_group_arre;
SHOW DATABASES;
USE whatsapp_group_arre;\

/* list of all users where a userId is the primary key */
CREATE TABLE users (
    userId int not null auto_increment,
    phoneNum int not null,
    created datetime,
    updated datetime,
    userName varchar(255),
    PRIMARY KEY (userId)
);


/* list of all groups */
CREATE TABLE grps (
    groupId int not null auto_increment,
    groupName varchar(255),
    membersCnt int,
    created datetime,
    updated datetime,
    groupDp varchar(512),
    createdBy varchar(255)
);

/* list all group members in all groups*/
CREATE TABLE grp_members (
	Id int not null auto_increment,
    groupId int not null auto_increment,
    userId varchar(255),
    addedAt datetime,
    removedAt datetime,
    PRIMARY KEY (Id),
    FOREIGN KEY (groupId)
    REFERENCES grps(groupId),
    FOREIGN KEY (userId)
    REFERENCES users(userId)
);

/* list of all messages connecting them to the group they have been sent on and to the user they have been sent to*/
CREATE TABLE messages (
    messageId int not null auto_increment,
    groupId int not null,
    userId int not null,
    messageText varchar(1000),
    mediaUrl varchar(512),
    createdAt datetime,
    PRIMARY KEY (messageId),
    FOREIGN KEY (groupId)
    REFERENCES grps(groupId),
    FOREIGN KEY (userId)
    REFERENCES users(userId)
);