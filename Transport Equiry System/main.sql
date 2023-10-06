-- Create 'Passengers' table
CREATE TABLE IF NOT EXISTS Passengers (
    passenger_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20)
);

-- Create 'Routes' table
CREATE TABLE IF NOT EXISTS Routes (
    route_id INT PRIMARY KEY,
    route_name VARCHAR(100),
    start_station VARCHAR(100),
    end_station VARCHAR(100)
);

-- Create 'Bookings' table
CREATE TABLE IF NOT EXISTS Bookings (
    booking_id INT PRIMARY KEY,
    passenger_id INT,
    route_id INT,
    booking_date DATE,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
    FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

-- Insert sample data into 'Passengers' table
INSERT INTO Passengers (name, email, phone_number)
VALUES
    ('John Doe', 'john@example.com', '123-456-7890'),
    ('Jane Smith', 'jane@example.com', '987-654-3210'),
    ('Alice Johnson', 'alice@example.com', '555-123-4567'),
    ('Bob Brown', 'bob@example.com', '555-987-6543'),
    ('Eve Williams', 'eve@example.com', '555-111-2222'),
    ('Charlie Davis', 'charlie@example.com', '555-333-4444');

-- Insert sample data into 'Routes' table
INSERT INTO Routes (route_id, route_name, start_station, end_station)
VALUES
    (1, 'Route A', 'Station X', 'Station Y'),
    (2, 'Route B', 'Station Y', 'Station Z'),
    (3, 'Route C', 'Station P', 'Station Q'),
    (4, 'Route D', 'Station M', 'Station N'),
    (5, 'Route E', 'Station S', 'Station T'),
    (6, 'Route F', 'Station U', 'Station V'),
    (7, 'Route G', 'Station J', 'Station K'),
    (8, 'Route H', 'Station G', 'Station H'),
    (9, 'Route I', 'Station D', 'Station E'),
    (10, 'Route J', 'Station R', 'Station L');

-- Insert sample booking data into 'Bookings' table
INSERT INTO Bookings (booking_id, passenger_id, route_id, booking_date)
VALUES
    (1, 1, 1, '2023-11-01'),
    (2, 2, 2, '2023-11-02'),
    (3, 3, 3, '2023-11-03'),
    (4, 4, 1, '2023-11-04'),
    (5, 5, 4, '2023-11-05');

--Retrieve Passenger Information for a Booking:
SELECT
    p.name AS passenger_name,
    p.email AS passenger_email,
    p.phone_number AS passenger_phone,
    r.route_name,
    r.start_station,
    r.end_station,
    b.booking_date
FROM
    Passengers p
JOIN
    Bookings b ON p.passenger_id = b.passenger_id
JOIN
    Routes r ON b.route_id = r.route_id
WHERE
    b.booking_id = 1;

--List All Routes with Start and End Stations:
SELECT
    route_name,
    start_station,
    end_station
FROM
    Routes;

--Find Passengers on a Specific Route:
SELECT
    p.name AS passenger_name,
    r.route_name
FROM
    Passengers p
JOIN
    Bookings b ON p.passenger_id = b.passenger_id
JOIN
    Routes r ON b.route_id = r.route_id
WHERE
    r.route_name = 'Route A';

-- Count the Number of Bookings for Each Route:
SELECT
    r.route_name,
    COUNT(b.booking_id) AS booking_count
FROM
    Routes r
LEFT JOIN
    Bookings b ON r.route_id = b.route_id
GROUP BY
    r.route_name;

-- Find Routes with No Bookings:
SELECT
    r.route_name
FROM
    Routes r
LEFT JOIN
    Bookings b ON r.route_id = b.route_id
WHERE
    b.booking_id IS NULL;
