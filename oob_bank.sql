create schema oob_bank;
use oob_bank;
CREATE TABLE `Bank` (
  `Bank_ID` VARCHAR(45) NOT NULL,
  `Bank_name` VARCHAR(45) NOT NULL,
  `Bank_address` VARCHAR(45) NOT NULL,
  `Bank_contact_number` VARCHAR(45) NOT NULL,
  `Bank_email` VARCHAR(45) NOT NULL,
  `Bank_status` VARCHAR(45) NOT NULL,
  `SWIFT_code` INT NOT NULL,
  PRIMARY KEY (`Bank_ID`));
INSERT INTO `Bank` (`Bank_ID`, `Bank_name`, `Bank_address`, `Bank_contact_number`, `Bank_email`, `Bank_status`, `SWIFT_code`)
VALUES (001, 'Our Own Bank', 'Jaipur', 229878, 'oobjaipur@oob.co.in', 'Active', '7689');
CREATE TABLE IF NOT EXISTS `Branch` (
  `Branch_ID` VARCHAR(45) NOT NULL,
  `Bank_ID` VARCHAR(45) NOT NULL,
  `Branch_name` VARCHAR(45) NOT NULL,
  `Branch_address` VARCHAR(45) NOT NULL,
  `Branch_manager` VARCHAR(45) NOT NULL,
  `Contact_phone` VARCHAR(45) NOT NULL,
  `Branch_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Branch_ID`),
  INDEX `fk_Branch_Bank_idx` (`Bank_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Branch_Bank`
    FOREIGN KEY (`Bank_ID`)
    REFERENCES `oob_bank`.`Bank` (`Bank_ID`));
INSERT INTO branch (Branch_ID, Bank_ID, Branch_name, Branch_address, Branch_manager, Contact_phone, Branch_status) 
VALUES (101, 001, 'Main Branch', 'MI Road, Jaipur', 'Ramesh Kumar', 9823456701, 'Active');

INSERT INTO branch (Branch_ID, Bank_ID, Branch_name, Branch_address, Branch_manager, Contact_phone, Branch_status) 
VALUES (102, 001, 'Malviya Nagar Branch', 'Malviya Nagar, Jaipur', 'Seema Gupta', 9823456702, 'Active');

INSERT INTO branch (Branch_ID, Bank_ID, Branch_name, Branch_address, Branch_manager, Contact_phone, Branch_status) 
VALUES (103, 001, 'Vaishali Nagar Branch', 'Vaishali Nagar, Jaipur', 'Pradeep Sharma', 9823456703, 'Active');

INSERT INTO branch (Branch_ID, Bank_ID, Branch_name, Branch_address, Branch_manager, Contact_phone, Branch_status) 
VALUES (104, 001, 'Tonk Road Branch', 'Tonk Road, Jaipur', 'Alka Mehra', 9823456704, 'Active');

INSERT INTO branch (Branch_ID, Bank_ID, Branch_name, Branch_address, Branch_manager, Contact_phone, Branch_status) 
VALUES (105, 001, 'C-Scheme Branch', 'C-Scheme, Jaipur', 'Vikas Jain', 9823456705, 'Active');
select * from branch;
CREATE TABLE `Employee` (
  `Employee_ID` VARCHAR(45) NOT NULL,
  `Branch_ID` VARCHAR(45) NOT NULL,
  `First_name` VARCHAR(45) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `Job_title` VARCHAR(45) NOT NULL,
  `Salary` DECIMAL(45) NOT NULL,
  `Hire_date` DATETIME NOT NULL,
  `Employee_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  INDEX `fk_Employee_Branch1_idx` (`Branch_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Branch1`
	FOREIGN KEY (`Branch_ID`)
    REFERENCES `oob_bank`.`Branch` (`Branch_ID`));
INSERT INTO `oob_bank`.`Employee` 
(`Employee_ID`, `Branch_ID`, `First_name`, `Last_name`, `Job_title`, `Salary`, `Hire_date`, `Employee_status`) 
VALUES 
('EMP1', 101, 'Ravi', 'Sharma', 'Branch Manager', 75000, '2020-01-15', 'Active'),
('EMP2', 101, 'Neha', 'Kumar', 'Assistant Manager', 60000, '2021-03-20', 'Active'),
('EMP3', 101, 'Amit', 'Mehta', 'Loan Officer', 50000, '2022-06-10', 'Active'),
('EMP4', 101, 'Priya', 'Singh', 'Teller', 35000, '2019-10-05', 'Active'),
('EMP5', 101, 'Rajesh', 'Jain', 'Accountant', 40000, '2020-12-12', 'Active'),
('EMP6', 101, 'Alok', 'Verma', 'Customer Service Representative', 32000, '2021-08-30', 'Active'),
('EMP7', 101, 'Sangeeta', 'Joshi', 'IT Specialist', 55000, '2020-05-25', 'Active'),
('EMP8', 101, 'Karan', 'Yadav', 'Compliance Officer', 48000, '2021-11-15', 'Active'),
('EMP9', 101, 'Meena', 'Kapoor', 'Security Officer', 30000, '2019-07-01', 'Active'),
('EMP10', 101, 'Vikas', 'Arora', 'Cashier', 31000, '2022-02-18', 'Active');
SELECT * FROM EMPLOYEE;
CREATE TABLE IF NOT EXISTS `oob_bank`.`ATM` (
  `ATM_ID` VARCHAR(45) NOT NULL,
  `Branch_ID` VARCHAR(45) NOT NULL,
  `Location` VARCHAR(45) NOT NULL,
  `ATM_type` VARCHAR(45) NOT NULL,
  `ATM_status` VARCHAR(45) NOT NULL,
  `Last_maintenance_date` DATETIME NOT NULL,
  PRIMARY KEY (`ATM_ID`),
  INDEX `fk_ATM_Branch1_idx` (`Branch_ID` ASC) VISIBLE,
  CONSTRAINT `fk_ATM_Branch1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `oob_bank`.`Branch` (`Branch_ID`));
INSERT INTO `oob_bank`.`Employee` 
(`Employee_ID`, `Branch_ID`, `First_name`, `Last_name`, `Job_title`, `Salary`, `Hire_date`, `Employee_status`) 
VALUES
('EMP1102', 102, 'Ankit', 'Sharma', 'Branch Manager', 78000, '2020-03-01', 'Active'),
('EMP2102', 102, 'Reema', 'Kapoor', 'Assistant Manager', 62000, '2021-05-10', 'Active'),
('EMP3102', 102, 'Suresh', 'Kumar', 'Loan Officer', 52000, '2022-07-25', 'Active'),
('EMP4102', 102, 'Megha', 'Bansal', 'Teller', 36000, '2019-11-15', 'Active'),
('EMP5102', 102, 'Pankaj', 'Verma', 'Accountant', 45000, '2020-01-20', 'Active'),
('EMP6102', 102, 'Neeta', 'Rai', 'Customer Service Representative', 34000, '2021-09-10', 'Active'),
('EMP7102', 102, 'Arun', 'Gupta', 'IT Specialist', 58000, '2020-04-18', 'Active'),
('EMP8102', 102, 'Divya', 'Singh', 'Compliance Officer', 49000, '2021-12-05', 'Active'),
('EMP9102', 102, 'Kamal', 'Joshi', 'Security Officer', 32000, '2019-08-20', 'Active'),
('EMP10102', 102, 'Monika', 'Agarwal', 'Cashier', 33000, '2022-03-12', 'Active');
INSERT INTO `Employee` 
(`Employee_ID`, `Branch_ID`, `First_name`, `Last_name`, `Job_title`, `Salary`, `Hire_date`, `Employee_status`) 
VALUES 
('EMP1103', 103, 'Rahul', 'Sharma', 'Branch Manager', 78000, '2020-03-10', 'Active'),
('EMP2103', 103, 'Sonal', 'Kapoor', 'Assistant Manager', 62000, '2021-06-15', 'Active'),
('EMP3103', 103, 'Kunal', 'Verma', 'Loan Officer', 52000, '2022-08-20', 'Active'),
('EMP4103', 103, 'Priyanka', 'Mehta', 'Teller', 36000, '2019-11-30', 'Active'),
('EMP5103', 103, 'Amit', 'Joshi', 'Accountant', 45000, '2020-02-18', 'Active'),
('EMP6103', 103, 'Neha', 'Singh', 'Customer Service Representative', 34000, '2021-09-25', 'Active'),
('EMP7103', 103, 'Rohit', 'Gupta', 'IT Specialist', 58000, '2020-05-12', 'Active'),
('EMP8103', 103, 'Meena', 'Jain', 'Compliance Officer', 49000, '2021-12-10', 'Active'),
('EMP9103', 103, 'Ajay', 'Chaudhary', 'Security Officer', 32000, '2019-08-15', 'Active'),
('EMP10103', 103, 'Komal', 'Agarwal', 'Cashier', 33000, '2022-04-05', 'Active');
INSERT INTO Employee 
(`Employee_ID`, `Branch_ID`, `First_name`, `Last_name`, `Job_title`, `Salary`, `Hire_date`, `Employee_status`) 
VALUES
('EMP1104', 104, 'Sanjay', 'Sharma', 'Branch Manager', 80000, '2020-04-01', 'Active'),
('EMP2104', 104, 'Ritika', 'Kapoor', 'Assistant Manager', 65000, '2021-05-15', 'Active'),
('EMP3104', 104, 'Vikram', 'Mehta', 'Loan Officer', 55000, '2022-07-20', 'Active'),
('EMP4104', 104, 'Pooja', 'Verma', 'Teller', 38000, '2019-12-10', 'Active'),
('EMP5104', 104, 'Anil', 'Joshi', 'Accountant', 46000, '2020-03-12', 'Active'),
('EMP6104', 104, 'Sneha', 'Singh', 'Customer Service Representative', 35000, '2021-09-15', 'Active'),
('EMP7104', 104, 'Ravi', 'Gupta', 'IT Specialist', 60000, '2020-06-25', 'Active'),
('EMP8104', 104, 'Komal', 'Agarwal', 'Compliance Officer', 50000, '2021-12-22', 'Active'),
('EMP9104', 104, 'Rajesh', 'Chaudhary', 'Security Officer', 33000, '2019-08-05', 'Active'),
('EMP10104', 104, 'Meenakshi', 'Jain', 'Cashier', 34000, '2022-04-18', 'Active');
INSERT INTO `Employee` 
(`Employee_ID`, `Branch_ID`, `First_name`, `Last_name`, `Job_title`, `Salary`, `Hire_date`, `Employee_status`) 
VALUES
('EMP1105', 105, 'Manoj', 'Sharma', 'Branch Manager', 82000, '2020-05-10', 'Active'),
('EMP2105', 105, 'Swati', 'Rai', 'Assistant Manager', 67000, '2021-07-18', 'Active'),
('EMP3105', 105, 'Deepak', 'Mehta', 'Loan Officer', 56000, '2022-09-12', 'Active'),
('EMP4105', 105, 'Pallavi', 'Verma', 'Teller', 37000, '2019-10-25', 'Active'),
('EMP5105', 105, 'Ramesh', 'Joshi', 'Accountant', 47000, '2020-01-30', 'Active'),
('EMP6105', 105, 'Aarti', 'Gupta', 'Customer Service Representative', 36000, '2021-08-22', 'Active'),
('EMP7105', 105, 'Siddharth', 'Singh', 'IT Specialist', 61000, '2020-07-19', 'Active'),
('EMP8105', 105, 'Kavita', 'Agarwal', 'Compliance Officer', 51000, '2021-12-14', 'Active'),
('EMP9105', 105, 'Rohit', 'Chopra', 'Security Officer', 34000, '2019-08-10', 'Active'),
('EMP10105', 105, 'Preeti', 'Jain', 'Cashier', 35000, '2022-03-05', 'Active');




update Employee
set Employee_id='EMP1101'
where Employee_id='EMP1';
update Employee
set Employee_id='EMP2101'
where Employee_id='EMP2';
update Employee
set Employee_id='EMP3101'
where Employee_id='EMP3';
update Employee
set Employee_id='EMP4101'
where Employee_id='EMP4';
update Employee
set Employee_id='EMP5101'
where Employee_id='EMP5';
update Employee
set Employee_id='EMP6101'
where Employee_id='EMP6';
update Employee
set Employee_id='EMP7101'
where Employee_id='EMP7';
update Employee
set Employee_id='EMP8101'
where Employee_id='EMP8';
update Employee
set Employee_id='EMP9101'
where Employee_id='EMP9';
update Employee
set Employee_id='EMP10101'
where Employee_id='EMP10';
SELECT * FROM EMPLOYEE;
INSERT INTO atm
(`ATM_ID`, `Branch_ID`, `Location`, `ATM_type`, `ATM_status`, `Last_maintenance_date`) 
VALUES 
('M101', 101, 'MI Road, Jaipur', 'Cash Dispenser', 'Active', '2025-01-20'),
('M102', 101, 'Malviya Nagar, Jaipur', 'Full-Service ATM', 'Active', '2025-02-10'),
('M103', 101, 'Tonk Road, Jaipur', 'Cash Dispenser', 'Maintenance', '2025-03-05');
INSERT INTO atm
(`ATM_ID`, `Branch_ID`, `Location`, `ATM_type`, `ATM_status`, `Last_maintenance_date`) 
VALUES 
('M201', 102, 'C-Scheme, Jaipur', 'Cash Dispenser', 'Active', '2025-01-25'),
('M202', 102, 'Vaishali Nagar, Jaipur', 'Full-Service ATM', 'Active', '2025-02-15'),
('M203', 102, 'Jhotwara, Jaipur', 'Cash Dispenser', 'Maintenance', '2025-03-10');
INSERT INTO ATM (`ATM_ID`, `Branch_ID`, `Location`, `ATM_type`, `ATM_status`, `Last_maintenance_date`) 
VALUES 
('M301', 103, 'Station Road, Jaipur', 'Cash Dispenser', 'Active', '2025-01-25'),
('M302', 103, 'Ajmeri Gate, Jaipur', 'Full-Service ATM', 'Active', '2025-02-10'),
('M303', 103, 'Civil Lines, Jaipur', 'Cash Dispenser', 'Maintenance', '2025-03-01');
INSERT INTO ATM (`ATM_ID`, `Branch_ID`, `Location`, `ATM_type`, `ATM_status`, `Last_maintenance_date`) 
VALUES 
('M401', 104, 'Raja Park, Jaipur', 'Cash Dispenser', 'Active', '2025-01-30'),
('M402', 104, 'Bapu Nagar, Jaipur', 'Full-Service ATM', 'Active', '2025-02-20'),
('M403', 104, 'Jawahar Circle, Jaipur', 'Cash Dispenser', 'Maintenance', '2025-03-10');
INSERT INTO ATM (`ATM_ID`, `Branch_ID`, `Location`, `ATM_type`, `ATM_status`, `Last_maintenance_date`) 
VALUES 
('M501', 105, 'Vaishali Nagar, Jaipur', 'Cash Dispenser', 'Active', '2025-02-05'),
('M502', 105, 'Malviya Nagar, Jaipur', 'Full-Service ATM', 'Active', '2025-03-01'),
('M503', 105, 'Tonk Road, Jaipur', 'Cash Dispenser', 'Maintenance', '2025-03-15');
CREATE TABLE IF NOT EXISTS `oob_bank`.`Customers` (
  `Customer_ID` VARCHAR(45) NOT NULL,
  `Branch_ID` VARCHAR(45) NOT NULL,
  `First_name` VARCHAR(45) NOT NULL,
  `Last_name` VARCHAR(45) NOT NULL,
  `Date_of_birth` VARCHAR(45) NOT NULL,
  `Gender` VARCHAR(15) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Phone_number` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Date_Joined` DATETIME NOT NULL,
  `National_ID/SSN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  INDEX `fk_Customers_Branch1_idx` (`Branch_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Customers_Branch1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `oob_bank`.`Branch` (`Branch_ID`));
INSERT INTO `Customers` 
(`Customer_ID`, `Branch_ID`, `First_name`, `Last_name`, `Date_of_birth`, `Gender`, `Address`, `Phone_number`, `Email`, `Date_Joined`, `National_ID/SSN`) 
VALUES
('C101', 101, 'Ramesh', 'Sharma', '1985-02-15', 'Male', 'MI Road, Jaipur', 9876543210, 'ramesh.sharma@example.com', '2023-01-15', 'ID12345'),
('C102', 101, 'Pooja', 'Mehta', '1990-05-10', 'Female', 'Malviya Nagar, Jaipur', 9876543211, 'pooja.mehta@example.com', '2023-03-20', 'ID67890'),
('C103', 101, 'Anil', 'Gupta', '1978-12-25', 'Male', 'Vaishali Nagar, Jaipur', 9876543212, 'anil.gupta@example.com', '2023-05-05', 'ID11223'),
('C104', 101, 'Sneha', 'Verma', '1992-08-08', 'Female', 'Tonk Road, Jaipur', 9876543213, 'sneha.verma@example.com', '2023-07-18', 'ID33445'),
('C105', 101, 'Vikram', 'Singh', '1988-03-30', 'Male', 'C-Scheme, Jaipur', 9876543214, 'vikram.singh@example.com', '2023-10-01', 'ID55667');
INSERT INTO `Customers` 
(`Customer_ID`, `Branch_ID`, `First_name`, `Last_name`, `Date_of_birth`, `Gender`, `Address`, `Phone_number`, `Email`, `Date_Joined`, `National_ID/SSN`) 
VALUES
('C201', 102, 'Amit', 'Kumar', '1984-04-12', 'Male', 'Malviya Nagar, Jaipur', 9876543215, 'amit.kumar@example.com', '2023-02-12', 'ID78901'),
('C202', 102, 'Priya', 'Sharma', '1989-07-19', 'Female', 'Vaishali Nagar, Jaipur', 9876543216, 'priya.sharma@example.com', '2023-04-22', 'ID89012'),
('C203', 102, 'Sunil', 'Verma', '1975-11-30', 'Male', 'Tonk Road, Jaipur', 9876543217, 'sunil.verma@example.com', '2023-06-18', 'ID90123'),
('C204', 102, 'Nidhi', 'Kapoor', '1993-09-25', 'Female', 'C-Scheme, Jaipur', 9876543218, 'nidhi.kapoor@example.com', '2023-08-14', 'ID01234'),
('C205', 102, 'Ravi', 'Singh', '1980-01-10', 'Male', 'Jhotwara, Jaipur', 9876543219, 'ravi.singh@example.com', '2023-09-28', 'ID12345');
INSERT INTO `Customers` 
(`Customer_ID`, `Branch_ID`, `First_name`, `Last_name`, `Date_of_birth`, `Gender`, `Address`, `Phone_number`, `Email`, `Date_Joined`, `National_ID/SSN`) 
VALUES
('C301', 103, 'Akash', 'Sharma', '1983-05-20', 'Male', 'Ajmeri Gate, Jaipur', 9876543220, 'akash.sharma@example.com', '2023-01-20', 'ID56789'),
('C302', 103, 'Kriti', 'Joshi', '1991-09-15', 'Female', 'Civil Lines, Jaipur', 9876543221, 'kriti.joshi@example.com', '2023-03-10', 'ID67890'),
('C303', 103, 'Vikas', 'Singh', '1987-12-05', 'Male', 'Sindhi Camp, Jaipur', 9876543222, 'vikas.singh@example.com', '2023-05-25', 'ID78901'),
('C304', 103, 'Anita', 'Kapoor', '1995-07-22', 'Female', 'Station Road, Jaipur', 9876543223, 'anita.kapoor@example.com', '2023-07-08', 'ID89012'),
('C305', 103, 'Rajiv', 'Kumar', '1980-03-10', 'Male', 'Bani Park, Jaipur', 9876543224, 'rajiv.kumar@example.com', '2023-09-18', 'ID90123');
INSERT INTO `Customers` 
(`Customer_ID`, `Branch_ID`, `First_name`, `Last_name`, `Date_of_birth`, `Gender`, `Address`, `Phone_number`, `Email`, `Date_Joined`, `National_ID/SSN`) 
VALUES
('C401', 104, 'Aarav', 'Sharma', '1982-06-12', 'Male', 'Raja Park, Jaipur', 9876543225, 'aarav.sharma@example.com', '2023-02-05', 'ID34567'),
('C402', 104, 'Isha', 'Gupta', '1990-10-08', 'Female', 'Bapu Nagar, Jaipur', 9876543226, 'isha.gupta@example.com', '2023-04-17', 'ID45678'),
('C403', 104, 'Harsh', 'Verma', '1985-03-15', 'Male', 'Jawahar Circle, Jaipur', 9876543227, 'harsh.verma@example.com', '2023-06-12', 'ID56789'),
('C404', 104, 'Rhea', 'Kapoor', '1992-09-25', 'Female', 'Gopalpura, Jaipur', 9876543228, 'rhea.kapoor@example.com', '2023-08-09', 'ID67890'),
('C405', 104, 'Kabir', 'Singh', '1987-01-18', 'Male', 'Adarsh Nagar, Jaipur', 9876543229, 'kabir.singh@example.com', '2023-10-23', 'ID78901');
INSERT INTO `Customers` 
(`Customer_ID`, `Branch_ID`, `First_name`, `Last_name`, `Date_of_birth`, `Gender`, `Address`, `Phone_number`, `Email`, `Date_Joined`, `National_ID/SSN`) 
VALUES
('C501', 105, 'Rohan', 'Sharma', '1981-03-15', 'Male', 'Vaishali Nagar, Jaipur', 9876543230, 'rohan.sharma@example.com', '2023-01-22', 'ID98765'),
('C502', 105, 'Megha', 'Singh', '1989-07-10', 'Female', 'Malviya Nagar, Jaipur', 9876543231, 'megha.singh@example.com', '2023-03-05', 'ID87654'),
('C503', 105, 'Vivek', 'Gupta', '1976-11-28', 'Male', 'Tonk Road, Jaipur', 9876543232, 'vivek.gupta@example.com', '2023-05-12', 'ID76543'),
('C504', 105, 'Anjali', 'Verma', '1993-08-18', 'Female', 'C-Scheme, Jaipur', 9876543233, 'anjali.verma@example.com', '2023-07-01', 'ID65432'),
('C505', 105, 'Karan', 'Kapoor', '1985-01-08', 'Male', 'Jawahar Circle, Jaipur', 9876543234, 'karan.kapoor@example.com', '2023-10-15', 'ID54321');
CREATE TABLE IF NOT EXISTS `oob_bank`.`Locker` (
  `Locker_ID` VARCHAR(45) NOT NULL,
  `Branch_ID` VARCHAR(45) NOT NULL,
  `Customer_ID` VARCHAR(45) NOT NULL,
  `Start_date` DATETIME NOT NULL,
  `End_date` DATETIME NULL,
  `Locker_charges` DECIMAL(45) NOT NULL,
  `Loker_status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Locker_ID`),
  INDEX `fk_Locker_Branch1_idx` (`Branch_ID` ASC) VISIBLE,
  INDEX `fk_Locker_Customers1_idx` (`Customer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Locker_Branch1`
    FOREIGN KEY (`Branch_ID`)
    REFERENCES `oob_bank`.`Branch` (`Branch_ID`),
  CONSTRAINT `fk_Locker_Customers1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `oob_bank`.`Customers` (`Customer_ID`));
INSERT INTO `oob_bank`.`Locker` 
(`Locker_ID`, `Branch_ID`, `Customer_ID`, `Start_date`, `End_date`, `Locker_charges`, `Loker_status`) 
VALUES 
('L101', 103, 'C302', '2023-01-01', '2024-01-01', 5000, 'Active');
INSERT INTO `oob_bank`.`Locker` 
(`Locker_ID`, `Branch_ID`, `Customer_ID`, `Start_date`, `End_date`, `Locker_charges`, `Loker_status`) 
VALUES 
('L102', 104, 'C401', '2023-02-01', '2024-02-01', 5500, 'Active');
INSERT INTO `oob_bank`.`Locker` 
(`Locker_ID`, `Branch_ID`, `Customer_ID`, `Start_date`, `End_date`, `Locker_charges`, `Loker_status`) 
VALUES 
('L103', 105, 'C503', '2023-03-01', '2024-03-01', 6000, 'Active');
INSERT INTO `oob_bank`.`Locker` 
(`Locker_ID`, `Branch_ID`, `Customer_ID`, `Start_date`, `End_date`, `Locker_charges`, `Loker_status`) 
VALUES 
('L104', 101, 'C102', '2023-04-01', '2024-04-01', 4500, 'Active');
CREATE TABLE IF NOT EXISTS `oob_bank`.`Audit_log` (
  `Log_ID` VARCHAR(45) NOT NULL,
  `Employee_ID` VARCHAR(45) NOT NULL,
  `Timestamp` DATETIME NOT NULL,
  `Action_type` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Log_ID`),
  INDEX `fk_Audit_log_Employee1_idx` (`Employee_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Audit_log_Employee1`
    FOREIGN KEY (`Employee_ID`)
    REFERENCES `oob_bank`.`Employee` (`Employee_ID`));












