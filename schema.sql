CREATE TABLE `Login` (
    `LOGIN_ID` INT PRIMARY KEY , 
    `LOGIN_MAILiD` VARCHAR(50) NOT NULL,
    `LOGIN_USERNAME` VARCHAR(50) NOT NULL ,
    `USER_PASSWORD` VARCHAR(50) PRIMARY KEY
);
CREATE TABLE `User` (
    `USER_ID` INT PRIMARY KEY , 
    `USER_NAME` VARCHAR(50) NOT NULL ,
    `USER_MOBILE` INT NOT NULL ,
    `USER_EMAIL` VARCHAR(50) NOT NULL,
    `USER_ADDRESS` VARCHAR(100) NOT NULL
);
CREATE TABLE `Roles` (
    `ROLE_ID` INT PRIMARY KEY ,
    `ROLE_NAME` VARCHAR(50) NOT NULL,
    `ROLE_DESC` VARCHAR(50) NOT NULL
);
CREATE TABLE `Permission` (
    `PER_ID` INT PRIMARY KEY ,
    `PER_ROLE_ID` VARCHAR(50) PRIMARY KEY , 
    `PER_MODULE` VARCHAR(50) NOT NULL , 
    `PER_NAME` VARCHAR(50) NOT NULL
);
CREATE TABLE `Bus` (
    `BUS_NAME` VARCHAR(50) NOT NULL,
    `BUS_ID` INT PRIMARY KEY ,
    `BUS_NUM` INT NOT NULL ,
    `BUS_TICKET` VARCHAR(50) NOT NULL ,
    `BUS_TYPE` VARCHAR(50) NOT NULL
);
CREATE TABLE `Station` (
    `STN_DESC` VARCHAR(50) NOT NULL ,
    `STN_TYPE` VARCHAR(50) NOT NULL ,
    `STN_NAME` VARCHAR(50) UNIQUE ,
    `STN_DES` VARCHAR(50) NOT NULL , 
    `STN_ID` INT PRIMARY KEY
);
CREATE TABLE `Fare` (
    `FARE_TITLE` VARCHAR(50) NOT NULL ,
    `FARE_TKT_ID` INT PRIMARY KEY,
    `FARE_ID` INT PRIMARY KEY ,
    `FARE_DESC` VARCHAR(50) NOT NULL ,
    `FARE_TYPE` VARCHAR(50) NOT NULL
);
CREATE TABLE `Time_Table` (
    `TMTA_ID` INT PRIMARY KEY,
    `TMTA_TYPE` VARCHAR(50) NOT NULL ,
    `TMTA_DESC` VARCHAR(50) NOT NULL
);



INSERT INTO `Login` (`LOGIN_ID`, `LOGIN_MAILiD`, `LOGIN_USERNAME`, `USER_PASSWORD`) VALUES
(1, 'user1@example.com', 'user1', 'pass123'),
(2, 'user2@example.com', 'user2', 'pass456'),
(3, 'user3@example.com', 'user3', 'pass789'),
(4, 'user4@example.com', 'user4', 'pass101'),
(5, 'user5@example.com', 'user5', 'pass202');

INSERT INTO `User` (`USER_ID`, `USER_NAME`, `USER_MOBILE`, `USER_EMAIL`, `USER_ADDRESS`) VALUES
(1, 'Alice', 9876543210, 'alice@example.com', '123 Main St'),
(2, 'Bob', 8765432109, 'bob@example.com', '456 Elm St'),
(3, 'Charlie', 7654321098, 'charlie@example.com', '789 Oak St'),
(4, 'David', 6543210987, 'david@example.com', '101 Pine St'),
(5, 'Eve', 5432109876, 'eve@example.com', '202 Maple St');

INSERT INTO `Roles` (`ROLE_ID`, `ROLE_NAME`, `ROLE_DESC`) VALUES
(1, 'Admin', 'Administrator role'),
(2, 'Manager', 'Manages operations'),
(3, 'Driver', 'Drives buses'),
(4, 'Passenger', 'Bus passenger'),
(5, 'Inspector', 'Inspects buses');

INSERT INTO `Permission` (`PER_ID`, `PER_ROLE_ID`, `PER_MODULE`, `PER_NAME`) VALUES
(1, '1', 'User Management', 'Full Access'),
(2, '2', 'Bus Management', 'Manage Buses'),
(3, '3', 'Route Management', 'View Routes'),
(4, '4', 'Ticket Booking', 'Book Tickets'),
(5, '5', 'Inspection', 'Inspect Buses');

INSERT INTO `Bus` (`BUS_NAME`, `BUS_ID`, `BUS_NUM`, `BUS_TICKET`, `BUS_TYPE`) VALUES
('City Express', 1, 101, '50 INR', 'AC'),
('Metro Rider', 2, 102, '40 INR', 'Non-AC'),
('Fast Track', 3, 103, '60 INR', 'Luxury'),
('Night Service', 4, 104, '30 INR', 'Sleeper'),
('Green Line', 5, 105, '55 INR', 'Electric');

INSERT INTO `Station` (`STN_DESC`, `STN_TYPE`, `STN_NAME`, `STN_DES`, `STN_ID`) VALUES
('Central Hub', 'Main', 'Station A', 'Main Bus Stop', 1),
('Suburb Stop', 'Local', 'Station B', 'Suburb Stop', 2),
('Downtown', 'Transit', 'Station C', 'City Center', 3),
('Industrial Zone', 'Depot', 'Station D', 'Factory Area', 4),
('Airport Link', 'Express', 'Station E', 'Airport Terminal', 5);

INSERT INTO `Fare` (`FARE_TITLE`, `FARE_TKT_ID`, `FARE_ID`, `FARE_DESC`, `FARE_TYPE`) VALUES
('Standard', 1, 101, 'Regular Fare', 'Fixed'),
('Student Discount', 2, 102, '50% Off', 'Discounted'),
('Senior Citizen', 3, 103, '30% Off', 'Discounted'),
('Weekend Pass', 4, 104, 'Unlimited Rides', 'Pass'),
('VIP Ticket', 5, 105, 'Premium Service', 'Luxury');

INSERT INTO `Time_Table` (`TMTA_ID`, `TMTA_TYPE`, `TMTA_DESC`) VALUES
(1, 'Weekday', '6 AM - 10 PM Service'),
(2, 'Weekend', '8 AM - 12 AM Service'),
(3, 'Night Shift', '10 PM - 5 AM Service'),
(4, 'Express', 'Limited Stops, Faster Service'),
(5, 'Holiday Special', 'Extra Buses on Holidays');




ALTER TABLE `Login` ADD COLUMN `LOGIN_STATUS` VARCHAR(10) NOT NULL DEFAULT 'Active';

ALTER TABLE `User` MODIFY COLUMN `USER_MOBILE` BIGINT NOT NULL;

ALTER TABLE `Roles` ADD COLUMN `ROLE_ACCESS_LEVEL` INT NOT NULL DEFAULT 1;

ALTER TABLE `Station` DROP COLUMN `STN_DES`;

ALTER TABLE `Bus` CHANGE COLUMN `BUS_NUM` `BUS_REG_NUMBER` VARCHAR(20) NOT NULL;




UPDATE `Login` SET `LOGIN_STATUS` = 'Inactive' WHERE `LOGIN_ID` = 3;

UPDATE `User` SET `USER_ADDRESS` = '999 New Ave' WHERE `USER_ID` = 2;

UPDATE `Roles` SET `ROLE_ACCESS_LEVEL` = 3 WHERE `ROLE_ID` = 1;

UPDATE `Bus` SET `BUS_TICKET` = '45 INR' WHERE `BUS_ID` = 2;

UPDATE `Station` SET `STN_TYPE` = 'Express' WHERE `STN_ID` = 5;




DELETE FROM `Login` WHERE `LOGIN_ID` = 5;

DELETE FROM `User` WHERE `USER_ID` = 3;

DELETE FROM `Roles` WHERE `ROLE_ID` = 4;

DELETE FROM `Bus` WHERE `BUS_ID` = 2;

DELETE FROM `Station` WHERE `STN_ID` = 1;




SELECT * FROM `Login`;

SELECT `USER_NAME`, `USER_EMAIL` FROM `User` WHERE `USER_ID` = 2;

SELECT `ROLE_NAME`, `ROLE_DESC` FROM `Roles`;

SELECT `BUS_NAME`, `BUS_TICKET` FROM `Bus` WHERE `BUS_TYPE` = 'AC';

SELECT `STN_NAME`, `STN_TYPE` FROM `Station` ORDER BY `STN_ID` DESC;



ALTER TABLE `Login` ADD CONSTRAINT `fk_login_user` FOREIGN KEY (`LOGIN_ID`) REFERENCES `User`(`USER_ID`);

ALTER TABLE `Permission` ADD CONSTRAINT `fk_permission_role` FOREIGN KEY (`PER_ROLE_ID`) REFERENCES `Roles`(`ROLE_ID`);

ALTER TABLE `Bus` ADD CONSTRAINT `fk_bus_fare` FOREIGN KEY (`BUS_ID`) REFERENCES `Fare`(`FARE_ID`);

ALTER TABLE `Fare` ADD CONSTRAINT `fk_fare_timetable` FOREIGN KEY (`FARE_TKT_ID`) REFERENCES `Time_Table`(`TMTA_ID`);

ALTER TABLE `Time_Table` ADD CONSTRAINT `fk_timetable_station` FOREIGN KEY (`TMTA_ID`) REFERENCES `Station`(`STN_ID`);




ALTER TABLE `User` ADD CONSTRAINT `chk_user_mobile` CHECK (`USER_MOBILE` > 0);

ALTER TABLE `Roles` ADD CONSTRAINT `chk_role_access_level` CHECK (`ROLE_ACCESS_LEVEL` BETWEEN 1 AND 5);

ALTER TABLE `Bus` ADD CONSTRAINT `chk_bus_ticket` CHECK (`BUS_TICKET` LIKE '%INR');

ALTER TABLE `Fare` ADD CONSTRAINT `chk_fare_type` CHECK (`FARE_TYPE` IN ('Fixed', 'Discounted', 'Pass', 'Luxury'));

ALTER TABLE `Time_Table` ADD CONSTRAINT `chk_tmta_type` CHECK (`TMTA_TYPE` IN ('Weekday', 'Weekend', 'Night Shift', 'Express', 'Holiday Special'));

