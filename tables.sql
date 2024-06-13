create database IS_PROJECT;
use IS_PROJECT;
create table location(
    locationID int(11) primary key auto_increment,
    Lnames varchar(100) not null,
    Lcity varchar(100) not null,
    Lstateorcounty VARCHAR(100) not null,
    Lcountry varchar(100) not null
);
CREATE Table customer(
    customerID int(11) PRIMARY KEY AUTO_INCREMENT,
    Cname varchar(100) NOT NULL,
    Cemail varchar(100) NOT NULL,
    Cpassword varchar(100) NOT NULL,
    Caddress varchar(255) NOT NULL,
    Cphone varchar(15) NOT NULL,
    locationID int(11) NOT NULL,
    Foreign Key (locationID) REFERENCES location(locationID)
);
CREATE TABLE ServiceProvider(
    serviceproviderID int(11) PRIMARY KEY AUTO_INCREMENT,
    SPname varchar(100) NOT NULL,
    SPemail varchar(100) NOT NULL,
    SPpassword varchar(100) NOT NULL,
    SPaddress varchar(255) NOT NULL,
    SPphone varchar(15) NOT NULL,
    SPserviceType varchar(100) NOT NULL,
    SPavailability TINYINT(1) NOT NULL,
    SPrating FLOAT NOT NULL,
    locationID int(11) NOT NULL,
    Foreign Key (locationID) REFERENCES location(locationID)
);
CREATE TABLE ServiceType(
    serviceTypeID int(11) PRIMARY KEY AUTO_INCREMENT,
    typeName varchar(100) NOT NULL,
    typeDescription varchar(255) NOT NULL
);
CREATE TABLE servicerequest(
    requestID int(11) PRIMARY KEY AUTO_INCREMENT,
    customerID int(11) NOT NULL,
    serviceproviderID int(11) NOT NULL,
    serviceTypeID int(11) NOT NULL,
    requestDate DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    cost FLOAT NOT NULL,
    Foreign Key (customerID) REFERENCES customer(customerID),
    Foreign Key (serviceproviderID) REFERENCES ServiceProvider(serviceproviderID),
    Foreign Key (serviceTypeID) REFERENCES ServiceType(serviceTypeID)
);
CREATE TABLE systemadministator(
    adminID int(11) PRIMARY KEY AUTO_INCREMENT,
    Aname varchar(100) NOT NULL,
    Aemail varchar(100) NOT NULL,
    Apassword varchar(100) NOT NULL
);
CREATE TABLE report(
    reportID int(11) PRIMARY KEY AUTO_INCREMENT,
    reportType VARCHAR(50) NOT NULL,
    generatedDate DATE NOT NULL,
    reportcontent TEXT NOT NULL,
    adminID int(11) NOT NULL,
    Foreign Key (adminID) REFERENCES systemadministator(adminID)
);