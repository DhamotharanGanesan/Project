create database Project_SQL;
use  Project_SQL;
drop database Project_SQL;
show tables;
-- Project MYSQL
-- Create Users table
CREATE TABLE Users (
    UserID INT primary key unique key,
    UserName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    UserType ENUM('JobSeeker', 'Company') NOT NULL
);

-- Create Companies table
CREATE TABLE Companies (
    CompanyID INT primary key unique key,
    CompanyName VARCHAR(100) NOT NULL,
    Industry VARCHAR(50),
    Location VARCHAR(100)
);

-- Create Jobs table
CREATE TABLE Jobs (
    JobID INT primary key unique key,
    Title VARCHAR(100) NOT NULL,
    Description TEXT,
    CompanyID INT,
    Constraint fk_companiesID foreign  KEY (CompanyID) REFERENCES Companies(CompanyID),
    Salary DECIMAL(10, 2),
    PostedDate DATE NOT NULL
);

-- Create Applications table
CREATE TABLE Applications (
    ApplicationID INT primary key unique key,
    JobID INT,
    UserID INT,
    Status ENUM('Pending', 'Accepted', 'Rejected') DEFAULT 'Pending',
    AppliedDate DATE NOT NULL,
    Constraint FK_jobID FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    Constraint FK_usersID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE  CandidateStatus (
    OfferID INT primary key unique key,
    JobID INT,
    UserID INT,
    OfferDate DATE,
     CandidateStatus TEXT,
    constraint FK_Offer foreign  KEY (JobID) REFERENCES Jobs(JobID),
    constraint FK_OfferID FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Insert sample data into OfferLetters table
INSERT INTO CandidateStatus (OfferID, JobID, UserID, OfferDate,  CandidateStatus) VALUES
(1, 1, 1, '2024-02-15', 'Selected'),
(2, 2, 2, '2024-02-16', 'Unselected'),
(3, 3, 3, '2024-02-17', 'Selected'),
(4, 4, 4, '2024-02-18', 'Selected'),
(5, 5, 5, '2024-02-19', 'Selected'),
(6, 6, 6, '2024-02-20', 'Selected'),
(7, 7, 7, '2024-02-21', 'Selected'),
(8, 8, 8, '2024-03-01', 'Selected'),
(9, 9, 9, '2024-03-02', 'Selected'),
(10, 10, 10, '2024-02-13', 'Selected'),
(11, 11, 11, '2024-02-17', 'Selected'),
(12, 12, 12, '2024-2-20', 'Selected'),
(13, 13, 13, '2024-03-03', 'Selected'),
(14, 14, 14, '2024-02-23', 'Selected'),
(15, 15, 15, '2024-02-28', 'Unselected'),
(16, 1, 16, '2024-03-03', 'Selected');

-- Insert values data into Companies table
INSERT INTO Companies (CompanyID, CompanyName, Industry, Location) VALUES
(1,'Tcs', 'IT services','Bengalure'),
(2, 'Infosys', 'IT services', 'Bengalure'),
(3, 'Wipro', 'IT services','Bengalure'),
(4, 'TechMahindra', 'IT services', 'Pune'),
(5, 'Cognizant', 'IT services', 'Chennai'),
(6, 'TataMotors', 'Manufactures', 'Hosure'),
(7, 'Marutisuzuki', 'Manufactures', 'Bengalure'),
(8, 'Hyundai', 'Manufactures', 'Chennai'),
(9, 'Toyota', 'Manufactures', 'Bidadi'),
(10, 'Honda', 'Manufactures', 'Gujarat'),
(11, 'Muthootfinance', 'Finance', 'Chennai'),
(12, 'L&T', 'Finance', 'Mumbai'),
(13, 'Bajajfinance LTD', 'Finance', 'Chennai');

-- Insert values data into Jobs table
INSERT INTO Jobs (JobID, Title, Description, CompanyID, Salary, PostedDate) VALUES
(1, 'Data Analyst ', 'Analyze and interpret data', 1, 30000.00, '2024-02-10'),
(2, 'Data science', 'Analyze large amounts of data', 2, 40000.00, '2023-12-10'),
(3, 'Full stack developer', ' Installs and configures linux systems', 3, 35000.00, '2024-02-23'),
(4, 'Linux', 'Installs and configures linux systems', 5, 45000.00, '2024-02-14'),
(5, 'AI developer', 'Develop AI software ', 4, 25000.00, '2024-02-10'),
(6, 'Software Engineer', 'Develop software applications', 5, 55000.00, '2023-12-11'),
(7, 'HR Specialist', 'Handle human resources tasks', 8, 43000.00, '2024-01-18'),
(8, 'Graphic Designer ', 'Create visual concepts', 3, 32000.00, '2024-02-16'),
(9, 'Software testing ', 'Bugs or issues are removed', 2, 25000.00, '2024-01-10'),
(10, 'Medical coding ', 'Researches and analyzes data need for reimbursement',5, 43000.00, '2024-02-7'),
(11, 'Healthcare', 'Work to promote maintain ', 5, 25000.00, '2024-02-10'),
(12, 'HR recruiter', 'Designing recruitment plans', 10, 34000.00, '2024-01-10'),
(13, 'Software Engineer', 'Develop software applications', 1, 34000.00, '2024-02-13'),
(14, 'Financial Analyst', 'Analyze financial data', 13, 32000.00, '2024-02-11'),
(15, 'Financial Analyst', 'Analyze financial data', 12, 34000.00, '2024-02-12');

-- Insert values data into Applications table
INSERT INTO Applications (ApplicationID, JobID, UserID, Status, AppliedDate) VALUES
(1, 1, 1, 'Pending', '204-02-14'),
(2, 2, 2, 'Accepted', '2023-12-10'),
(3, 3, 3, 'Accepted', '2024-02-23'),
(4, 4, 4, 'Accepted', '2024-02-14'),
(5, 6, 5, 'Accepted', '2023-12-11'),
(6, 7, 6, 'Accepted', '2024-01-18'),
(7, 8, 7, 'Accepted', '2024-02-16'),
(8, 9, 8, 'Accepted', '2024-01-10'),
(9,10, 9, 'Accepted', '2024-02-17'),
(10, 10, 10, 'Accepted', '2024-01-10'),
(11, 11, 11, 'Accepted', '2024-01-10'),
(12, 12, 12, 'Accepted', '2023-12-25'),
(13, 13, 13, 'Accepted', '2023-12-14'),
(14, 14, 14, 'Accepted', '2024-02-13'),
(15, 15, 15, 'Accepted', '2024-02-13'),
(16, 1, 15, 'Accepted', '2024-02-12');

drop table  Companies ; 

drop table Jobs; 

drop table Applicatinons; 

alter table Jobs
drop foreign key fk_companiesID;

alter table Applications
drop foreign key FK_jobID  ;

alter table Applications
drop foreign key FK_usersID;

-- Insert sample data into Users table
INSERT INTO Users (UserID, UserName, Email, Password, UserType) VALUES
(1, 'John', 'john.doe@example.com', 'password123', 'JobSeeker'),
(2, 'Chinna', 'info@companyabc.com', 'companyPass', 'JobSeeker'),
(3, 'Dhamu', 'dhamu@example.com', 'password123', 'JobSeeker'),
(4, 'Captan', 'cap@companyabc.com', 'companyPass', 'Company'),
(5, 'Sri', 'sri@companyabc.com', 'companyPass1', 'JobSeeker'),
(6, 'Hari', 'hari@companyabc.com', 'companyPass2', 'JobSeeker'),
(7, 'malu', 'malu@companyabc.com', 'companyPass3', 'JobSeeker'),
(8, 'Mani', 'mani@companyabc.com', 'companyPass4', 'JobSeeker'),
(9, 'Abi', 'abi@companyabc.com', 'companyPass5', 'JobSeeker'),
(10, 'Mohan', 'mohan@companyabc.com', 'companyPass6', 'JobSeeker'),
(11, 'Maran', 'maran@companyabc.com', 'companyPass7', 'JobSeeker'),
(12, 'Nithish', 'nithish@companyabc.com', 'companyPass8', 'JobSeeker'),
(13, 'Nithishkumar', 'nithish@companyabc.com', 'companyPass9', 'JobSeeker'),
(14, 'Mohankumar', 'mohan@companyabc.com', 'companyPass0', 'JobSeeker'),
(15, 'Captan', 'captan@companyabc.com', 'password121', 'JobSeeker'),
(16, 'Maran', 'marann@companyabc.com', 'password122', 'JobSeeker'),
(17, 'Suriya', 'suriya@companyabc.com', 'password123', 'JobSeeker'),
(18, 'Gowtham', 'thamm@companyabc.com', 'password124', 'JobSeeker'),
(19, 'Ragu', 'ragu@companyabc.com', 'password125', 'JobSeeker'),
(20, 'Varadhan', 'varadhan@companyabc.com', 'password126', 'JobSeeker'),
(21, 'Hamnath', 'hema@companyabc.com', 'password127', 'JobSeeker'),
(22, 'Karthik', 'karthi@companyabc.com', 'password128', 'Company'),
(23, 'Vasigaran', 'vasi@companyabc.com', 'password129', 'JobSeeker'),
(24, 'Thamu', 'thamu@companyabc.com', 'password120', 'JobSeeker'),
(25, 'Ram', 'ram@companyabc.com', 'password223', 'JobSeeker'),
(26, 'Anbu', 'anbu@companyabc.com', 'companyPass12', 'Company'),
(27, 'Udhiya', 'udhiya@companyabc.com', 'companyPass13', 'Company');
-- What information is stored in the CandidateStatus table?
select * from  CandidateStatus;

-- What kind of information is stored in the Users table?
select * from  Users;

-- What details are stored in the Jobs table?
select * from  Jobs;

-- What kind of information is stored in the Applications table?
select * from  Applications;

-- What information does the Companies table contain?
select * from  Companies;

-- How are the results of the query SELECT * FROM Jobs ORDER BY Title, JobID ordered?
SELECT * FROM Jobs
ORDER BY Title , JobID;

-- What does the query selecting from Jobs with a salary range of 30000 to 55000 return?
select Jobs.JobID,   Applications.AppliedDate, Applications. ApplicationID
from  Jobs
join  Applications on Applications.JobID = Applications.JobID where jobs. salary between 30000 and 55000;

 -- What information is retrieved by joining Jobs and Applications based on the JobID without a salary range filter?
select  Jobs.JobID,    Applications. ApplicationID
from  Jobs
join  Applications on Applications.JobID = Applications.JobID ;

 -- What information is retrieved by selecting distinct job titles and application IDs?
SELECT DISTINCT Jobs.Title, Applications.ApplicationID
FROM Jobs
JOIN Applications ON Jobs.JobID = Applications.JobID;

-- What data is obtained by joining the Users and CandidateStatus tables based on the UserID and JobID?
SELECT  CandidateStatus.CandidateStatus, Users.UserName
FROM Users
JOIN CandidateStatus ON Users.UserID = CandidateStatus .JobID;

-- How does the query differ when using a left join instead of an inner join between Users and CandidateStatus?
SELECT  CandidateStatus.CandidateStatus, Users.UserName
FROM Users
left JOIN CandidateStatus ON Users.UserID = CandidateStatus .JobID;

-- What information is retrieved by selecting users where the UserType is 'Company'?
SELECT  * FROM Users where Users . UserType ='Company';

-- What does the query selecting from Jobs with a title of "Data Analyst" return?
select * from  Jobs  where  Title  in ("Data Analyst ")



