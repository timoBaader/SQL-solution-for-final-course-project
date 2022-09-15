
SELECT * FROM EventInstance

INSERT INTO EventType (type) VALUES 
('dance'),
('theatre'),
('concert');

INSERT INTO Artist (name, email, specialRequest) VALUES 
('Steve Vai', 'steveboy65@gmail.com', '3 neck guitar'),
('Brandon Ellis', 'brandon@gmail.com', 'A ripe banana'),
('Aleksi Laiho', 'aleksilaiho@gmail.com', 'A pet elephant');

INSERT INTO Venue (name, size, location) VALUES 
('Nosturi', 200, 'harbour street 3'),
('Tavastia', 100, 'Kamppi street 14');


INSERT INTO PickUpLocation(location) VALUES 
('hobart town house'),
('hobart library');


INSERT INTO EventInstance (eventTypeId, date, isCanceled, artistId, venueId) VALUES 
(1, '2022-06-12', 'false', 1, 1),
(2, '2022-05-12', 'false', 2, 2);

INSERT INTO Ticket (eventInstanceId, price, amountOfTicketsAvailable, ticketsSold) VALUES 
(1, 65, 100, 67),
(2, 30, 50, 26);

INSERT INTO Booking (clientPhoneNumber, ticketId, bookingDate, pickUpLocationId, totalPrice, paid) VALUES
(04581728, 2, '2022-03-12', 1, 150, 'true'),
(04513379, 1, '2022-02-10', 2, 70, 'true');

/* SQL QUERIES TO TEST */

SELECT *
FROM EventInstance
JOIN EventType ON (EventInstance.eventTypeId = EventType.eventTypeId)
WHERE type = 'dance'


SELECT email
FROM Artist
WHERE name = 'aleksi laiho'

SELECT type, Artist.name AS 'Artist', Venue.name AS 'Venue', date, location
FROM EventInstance
JOIN Venue ON (EventInstance.venueID = Venue.VenueID)
JOIN EventType ON (EventInstance.EventTypeID = EventType.EventTypeID)
JOIN Artist ON (EventInstance.ArtistID = Artist.ArtistID)
Where DATENAME(month, date) = DATENAME(month, GETDATE())


