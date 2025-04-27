CREATE TABLE `Login` (
    `LOGIN_ID` INT PRIMARY KEY , 
    `LOGIN_MAILiD` VARCHAR(50) NOT NULL,
    `LOGIN_USERNAME` VARCHAR(50) NOT NULL ,
    `USER_PASSWORD` VARCHAR(50) NOT NULL
);
CREATE TABLE `User` (
    `USER_ID` INT PRIMARY KEY , 
    `USER_NAME` VARCHAR(50) NOT NULL ,
    `USER_MOBILE` VARCHAR(20) NOT NULL ,
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
    `PER_ROLE_ID` INT UNIQUE , 
    `PER_MODULE` VARCHAR(50) NOT NULL , 
    `PER_NAME` VARCHAR(50) NOT NULL
);
CREATE TABLE Bus (
    BUS_NAME VARCHAR(50) NOT NULL,
    BUS_ID INT PRIMARY KEY,
    BUS_NUM INT NOT NULL,
    BUS_TICKET VARCHAR(50) NOT NULL,
    BUS_TYPE VARCHAR(50) NOT NULL
);
CREATE TABLE `Station` (
    `STN_DESC` VARCHAR(50) NOT NULL ,
    `STN_TYPE` VARCHAR(50) NOT NULL ,
    `STN_NAME` VARCHAR(50) UNIQUE ,
    `STN_DES` VARCHAR(50) NOT NULL , 
    `STN_ID` INT PRIMARY KEY
);
CREATE TABLE Fare (
    FARE_TITLE VARCHAR(50) NOT NULL,
    FARE_TKT_ID INT NOT NULL,
    FARE_ID INT PRIMARY KEY,
    FARE_DESC VARCHAR(50) NOT NULL,
    FARE_TYPE VARCHAR(50) NOT NULL
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

INSERT INTO Bus (BUS_NAME, BUS_ID, BUS_NUM, BUS_TICKET, BUS_TYPE) VALUES
('City Express', 1, 201, 'Online', 'AC'),
('Metro Shuttle', 2, 202, 'Counter', 'Non-AC'),
('Night Rider', 3, 203, 'Online', 'Sleeper'),
('Weekend Explorer', 4, 204, 'Counter', 'Luxury'),
('Student Special', 5, 205, 'Online', 'Mini');


INSERT INTO `Station` (`STN_DESC`, `STN_TYPE`, `STN_NAME`, `STN_DES`, `STN_ID`) VALUES
('Central Hub', 'Main', 'Station A', 'Main Bus Stop', 1),
('Suburb Stop', 'Local', 'Station B', 'Suburb Stop', 2),
('Downtown', 'Transit', 'Station C', 'City Center', 3),
('Industrial Zone', 'Depot', 'Station D', 'Factory Area', 4),
('Airport Link', 'Express', 'Station E', 'Airport Terminal', 5);

INSERT INTO Fare (FARE_TITLE, FARE_TKT_ID, FARE_ID, FARE_DESC, FARE_TYPE) VALUES
('Standard Fare', 101, 1, 'Regular fare', 'Economy'),
('Express Fare', 102, 2, 'Fast route', 'Business'),
('Night Fare', 103, 3, 'Late night service', 'Premium'),
('Weekend Fare', 104, 4, 'Higher weekend rates', 'Luxury'),
('Student Fare', 105, 5, 'Discount for students', 'Economy');


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





-- TRIGGER: Automatically update login status when user is deleted
DELIMITER $$
CREATE TRIGGER after_user_delete
AFTER DELETE ON `User`
FOR EACH ROW
BEGIN
    UPDATE `Login` SET `LOGIN_STATUS` = 'Inactive' WHERE `LOGIN_ID` = OLD.USER_ID;
END$$
DELIMITER ;

-- TRIGGER: Prevent deleting a role if assigned to a user
DELIMITER $$
CREATE TRIGGER before_role_delete
BEFORE DELETE ON `Roles`
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM `Permission` WHERE `PER_ROLE_ID` = OLD.ROLE_ID) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete role, it is assigned to permissions';
    END IF;
END$$
DELIMITER ;

-- CURSOR: Fetch all bus names of AC type
DELIMITER $$
CREATE PROCEDURE get_ac_buses()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE bus_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT `BUS_NAME` FROM `Bus` WHERE `BUS_TYPE` = 'AC';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO bus_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT bus_name;
    END LOOP;
    CLOSE cur;
END$$
DELIMITER ;

-- STORED PROCEDURE: Add a new bus
DELIMITER $$
CREATE PROCEDURE add_bus(
    IN p_bus_name VARCHAR(50), 
    IN p_bus_id INT, 
    IN p_bus_reg_number VARCHAR(20), 
    IN p_bus_ticket VARCHAR(50), 
    IN p_bus_type VARCHAR(50)
)
BEGIN
    INSERT INTO `Bus` (`BUS_NAME`, `BUS_ID`, `BUS_REG_NUMBER`, `BUS_TICKET`, `BUS_TYPE`)
    VALUES (p_bus_name, p_bus_id, p_bus_reg_number, p_bus_ticket, p_bus_type);
END$$
DELIMITER ;

-- STORED FUNCTION: Calculate fare with discount
DELIMITER $$
CREATE FUNCTION calculate_discounted_fare(fare_amount DECIMAL(10,2), discount_percentage INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN fare_amount - (fare_amount * discount_percentage / 100);
END$$
DELIMITER ;

-- TRIGGER: Prevent fare from being updated to a non-existent timetable
DELIMITER $$
CREATE TRIGGER before_fare_update
BEFORE UPDATE ON `Fare`
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM `Time_Table` WHERE `TMTA_ID` = NEW.FARE_TKT_ID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid timetable reference';
    END IF;
END$$
DELIMITER ;

-- Ensure compatibility with MySQL Workbench
SET GLOBAL log_bin_trust_function_creators = 1;

-- 1. JOIN Query: Fetch Users with Their Login Details
SELECT u.USER_ID, u.USER_NAME, u.USER_EMAIL, l.LOGIN_USERNAME, l.LOGIN_STATUS
FROM `User` u
JOIN `Login` l ON u.USER_ID = l.LOGIN_ID;

-- 2. Subquery with SET Operations: Get Users Without Login Details
SELECT USER_ID, USER_NAME, USER_EMAIL
FROM `User`
WHERE USER_ID NOT IN (SELECT LOGIN_ID FROM `Login`);

-- 3. View: Active Users with Their Roles
CREATE VIEW ActiveUsers AS
SELECT u.USER_ID, u.USER_NAME, u.USER_EMAIL, r.ROLE_NAME, l.LOGIN_STATUS
FROM `User` u
JOIN `Login` l ON u.USER_ID = l.LOGIN_ID
JOIN `Roles` r ON r.ROLE_ID IN (SELECT PER_ROLE_ID FROM `Permission`)
WHERE l.LOGIN_STATUS = 'Active';

-- 4. Complex Join: Fetch Bus Details with Fare & Time Table
SELECT b.BUS_NAME, b.BUS_REG_NUMBER, f.FARE_TITLE, f.FARE_DESC, tt.TMTA_DESC
FROM `Bus` b
JOIN `Fare` f ON b.BUS_ID = f.FARE_ID
JOIN `Time_Table` tt ON f.FARE_TKT_ID = tt.TMTA_ID;

-- 5. Stored Procedure: Fetch Users by Role
DELIMITER $$
CREATE PROCEDURE GetUsersByRole(IN role_name VARCHAR(50))
BEGIN
    SELECT u.USER_ID, u.USER_NAME, u.USER_EMAIL, r.ROLE_NAME
    FROM `User` u
    JOIN `Roles` r ON r.ROLE_ID IN (SELECT PER_ROLE_ID FROM `Permission`)
    WHERE r.ROLE_NAME = role_name;
END$$
DELIMITER ;

-- 6. Cursor: Fetch Bus Names and Ticket Prices
DELIMITER $$  
CREATE PROCEDURE FetchBusTickets()  
BEGIN  
    DECLARE done INT DEFAULT 0;  
    DECLARE bus_name VARCHAR(50);  
    DECLARE bus_ticket VARCHAR(50);  
    DECLARE cur CURSOR FOR SELECT BUS_NAME, BUS_TICKET FROM `Bus`;  
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;  

    OPEN cur;  
    read_loop: LOOP  
        FETCH cur INTO bus_name, bus_ticket;  
        IF done THEN  
            LEAVE read_loop;  
        END IF;  
        SELECT bus_name, bus_ticket;  
    END LOOP;  
    CLOSE cur;  
END$$  
DELIMITER ;  

-- 7. Trigger: Prevent Duplicate Bus Registration Numbers
DELIMITER $$
CREATE TRIGGER prevent_duplicate_bus_reg
BEFORE INSERT ON `Bus`
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM `Bus` WHERE BUS_REG_NUMBER = NEW.BUS_REG_NUMBER) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate bus registration number not allowed';
    END IF;
END$$
DELIMITER ;

-- 8. Function: Calculate Discounted Fare
DELIMITER $$
CREATE FUNCTION calculate_discounted_fare(fare_amount DECIMAL(10,2), discount_percentage INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN fare_amount - (fare_amount * discount_percentage / 100);
END$$
DELIMITER ;

-- 9. Trigger: Prevent Fare from Being Updated to Non-Existent Timetable
DELIMITER $$  
CREATE TRIGGER before_fare_update  
BEFORE UPDATE ON `Fare`  
FOR EACH ROW  
BEGIN  
    IF NOT EXISTS (SELECT 1 FROM `Time_Table` WHERE `TMTA_ID` = NEW.FARE_TKT_ID) THEN  
        SIGNAL SQLSTATE '45000'  
        SET MESSAGE_TEXT = 'Invalid timetable reference';  
    END IF;  
END$$  
DELIMITER ;

-- 10. Ensure Compatibility with MySQL Workbench
SET GLOBAL log_bin_trust_function_creators = 1;







-- Triggers
DELIMITER $$
CREATE TRIGGER after_user_delete
AFTER DELETE ON `User`
FOR EACH ROW
BEGIN
    UPDATE `Login` SET `LOGIN_STATUS` = 'Inactive' WHERE `LOGIN_ID` = OLD.USER_ID;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER before_role_delete
BEFORE DELETE ON `Roles`
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM `Permission` WHERE `PER_ROLE_ID` = OLD.ROLE_ID) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete role, it is assigned to permissions';
    END IF;
END$$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER prevent_duplicate_bus_reg
BEFORE INSERT ON `Bus`
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM `Bus` WHERE BUS_REG_NUMBER = NEW.BUS_REG_NUMBER) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Duplicate bus registration number not allowed';
    END IF;
END$$
DELIMITER ;

-- Cursors and Stored Procedures
DELIMITER $$
CREATE PROCEDURE get_ac_buses()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE bus_name VARCHAR(50);
    DECLARE cur CURSOR FOR SELECT `BUS_NAME` FROM `Bus` WHERE `BUS_TYPE` = 'AC';
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    
    OPEN cur;
    read_loop: LOOP
        FETCH cur INTO bus_name;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT bus_name;
    END LOOP;
    CLOSE cur;
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE add_bus(
    IN p_bus_name VARCHAR(50), 
    IN p_bus_id INT, 
    IN p_bus_reg_number VARCHAR(20), 
    IN p_bus_ticket VARCHAR(50), 
    IN p_bus_type VARCHAR(50)
)
BEGIN
    INSERT INTO `Bus` (`BUS_NAME`, `BUS_ID`, `BUS_REG_NUMBER`, `BUS_TICKET`, `BUS_TYPE`)
    VALUES (p_bus_name, p_bus_id, p_bus_reg_number, p_bus_ticket, p_bus_type);
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION calculate_discounted_fare(fare_amount DECIMAL(10,2), discount_percentage INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN fare_amount - (fare_amount * discount_percentage / 100);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE FetchBusTickets()
BEGIN  
    DECLARE done INT DEFAULT 0;  
    DECLARE bus_name VARCHAR(50);  
    DECLARE bus_ticket VARCHAR(50);  
    DECLARE cur CURSOR FOR SELECT BUS_NAME, BUS_TICKET FROM `Bus`;  
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;  

    OPEN cur;  
    read_loop: LOOP  
        FETCH cur INTO bus_name, bus_ticket;  
        IF done THEN  
            LEAVE read_loop;  
        END IF;  
        SELECT bus_name, bus_ticket;  
    END LOOP;  
    CLOSE cur;  
END$$  
DELIMITER ;



-- Hypothetical: If Login table had USER_ID
SELECT L.LOGIN_USERNAME, U.USER_NAME
FROM Login L
INNER JOIN User U
ON L.LOGIN_ID = U.USER_ID;


SELECT U.USER_NAME, L.LOGIN_USERNAME
FROM User U
LEFT JOIN Login L
ON U.USER_ID = L.LOGIN_ID;



SELECT U.USER_NAME, L.LOGIN_USERNAME
FROM User U
RIGHT JOIN Login L
ON U.USER_ID = L.LOGIN_ID;



SELECT U.USER_NAME, L.LOGIN_USERNAME
FROM User U
LEFT JOIN Login L ON U.USER_ID = L.LOGIN_ID
UNION
SELECT U.USER_NAME, L.LOGIN_USERNAME
FROM User U
RIGHT JOIN Login L ON U.USER_ID = L.LOGIN_ID;



SELECT S.STN_NAME, B.BUS_NAME
FROM Station S
CROSS JOIN Bus B;



SELECT A.USER_NAME AS User1, B.USER_NAME AS User2
FROM User A
JOIN User B ON A.USER_MOBILE = B.USER_MOBILE
WHERE A.USER_ID <> B.USER_ID;


SELECT *
FROM Login
NATURAL JOIN User;


CREATE PROCEDURE AddUser(
    IN p_user_id INT,
    IN p_user_name VARCHAR(50),
    IN p_user_mobile VARCHAR(20),
    IN p_user_email VARCHAR(50),
    IN p_user_address VARCHAR(100)
)
BEGIN
    INSERT INTO User (USER_ID, USER_NAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS)
    VALUES (p_user_id, p_user_name, p_user_mobile, p_user_email, p_user_address);
END //

DELIMITER ;


DELIMITER //

CREATE PROCEDURE GetAllBuses()
BEGIN
    SELECT * FROM Bus;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetBusTicketType(busId INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE ticketType VARCHAR(50);
    
    SELECT BUS_TICKET INTO ticketType
    FROM Bus
    WHERE BUS_ID = busId;
    
    RETURN ticketType;
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION GetStationName(stnId INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE name VARCHAR(50);

    SELECT STN_NAME INTO name
    FROM Station
    WHERE STN_ID = stnId;

    RETURN name;
END //

DELIMITER ;



#### UNNORMALIZED TABLE ####

CREATE TABLE StudentData (
    StudentID INT,
    StudentName VARCHAR(50),
    Courses VARCHAR(255),  -- Comma-separated values (unstructured)
    PhoneNumbers VARCHAR(255)  -- Comma-separated values (unstructured)
);

INSERT INTO StudentData VALUES 
(1, 'Alice', 'Math, Science', '9876543210, 8765432109'),
(2, 'Bob', 'Math', '7654321098'),
(3, 'Charlie', 'History, Science, Math', '6543210987, 5432109876');


#### CONVERTING TO 1NF ####

CREATE TABLE StudentData_1NF (
    StudentID INT,
    StudentName VARCHAR(100),
    Course VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

-- Inserting values as separate rows for each course and phone number
INSERT INTO StudentData_1NF (StudentID, StudentName, Course, PhoneNumber) VALUES
(1, 'Alice', 'Math', '9876543210'),
(1, 'Alice', 'Science', '9876543210'),
(1, 'Alice', 'Math', '8765432109'),
(1, 'Alice', 'Science', '8765432109'),
(2, 'Bob', 'Math', '7654321098'),
(3, 'Charlie', 'History', '6543210987'),
(3, 'Charlie', 'Science', '6543210987'),
(3, 'Charlie', 'Math', '6543210987'),
(3, 'Charlie', 'History', '5432109876'),
(3, 'Charlie', 'Science', '5432109876'),
(3, 'Charlie', 'Math', '5432109876');



#### 2nd NORMAL FORM ####
#### TO REMOVE PARTIAL DEPENDENCY ####

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100)
);

INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    Course VARCHAR(100)
);

INSERT INTO Courses (Course) VALUES
('Math'),
('Science'),
('History');

CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollment (StudentID, CourseID) VALUES
(1, 1),  
(1, 2),  
(2, 1),  
(3, 3),  
(3, 2),  
(3, 1);  

CREATE TABLE PhoneNumbers (
    PhoneNumber VARCHAR(15),
    StudentID INT,
    PRIMARY KEY (PhoneNumber),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

INSERT INTO PhoneNumbers (PhoneNumber, StudentID) VALUES
('9876543210', 1),
('8765432109', 1),
('7654321098', 2),
('6543210987', 3),
('5432109876', 3);

