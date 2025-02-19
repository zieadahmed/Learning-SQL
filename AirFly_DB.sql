create database AirFly_DB
use AirFly_DB
CREATE TABLE Airline (
    airline_id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    address NVARCHAR(255),
    contact_person NVARCHAR(100),
    phone_number NVARCHAR(20)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    address NVARCHAR(255),
    birthday DATE,
    gender NVARCHAR(10),
    position NVARCHAR(50),
    qualifications NVARCHAR(MAX),
    airline_id INT,
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)
);

CREATE TABLE Aircraft (
    aircraft_id INT PRIMARY KEY,
    model NVARCHAR(100) NOT NULL,
    capacity INT,
    airline_id INT,
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)
);

CREATE TABLE Transaction (
    transaction_id INT PRIMARY KEY,
    description NVARCHAR(MAX),
    amount DECIMAL(10, 2),
    transaction_date DATE,
    aircraft_id INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE Crew (
    crew_id INT PRIMARY KEY,
    major_pilot NVARCHAR(100),
    assistant_pilot NVARCHAR(100),
    hostess1 NVARCHAR(100),
    hostess2 NVARCHAR(100),
    aircraft_id INT UNIQUE,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE Route (
    route_id INT PRIMARY KEY,
    origin NVARCHAR(100),
    destination NVARCHAR(100),
    distance INT,
    classification NVARCHAR(50),
    aircraft_id INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id)
);

CREATE TABLE Flight (
    flight_id INT PRIMARY KEY,
    dept_datetime DATETIME2,
    arr_datetime DATETIME2,
    price_per_passenger DECIMAL(10, 2),
    num_passengers INT,
    time_spent TIME,
    aircraft_id INT,
    crew_id INT,
    route_id INT,
    FOREIGN KEY (aircraft_id) REFERENCES Aircraft(aircraft_id),
    FOREIGN KEY (crew_id) REFERENCES Crew(crew_id),
    FOREIGN KEY (route_id) REFERENCES Route(route_id)
);
