
CREATE TABLE EventType
(
  eventTypeId			INT		NOT NULL IDENTITY,
  type				VARCHAR(20)	NOT NULL,
 
  CONSTRAINT type			CHECK (type IN ('concert', 'dance', 'theatre')),
  CONSTRAINT PK_eventTypeId		PRIMARY KEY (eventTypeId),
);

CREATE TABLE Artist
(
	artistId		INT		NOT NULL IDENTITY,
	name			VARCHAR(20)		NOT NULL,
	email			VARCHAR(255)	NOT NULL,
	specialRequest	VARCHAR(200)	NOT NULL,

	CONSTRAINT PK_artistId PRIMARY KEY (artistId),
);

CREATE TABLE Venue
(
	venueId			INT		NOT NULL IDENTITY,
	size			INTEGER		NOT NULL,
	name			VARCHAR(20) NOT NULL,
	location		VARCHAR(20)	NOT NULL,


	CONSTRAINT PK_venueId PRIMARY KEY (venueId),
	CONSTRAINT C_size	CHECK (size IN (80, 100, 200, 400, 700)),
);

CREATE TABLE EventInstance
(
	eventInstanceId	INT		NOT NULL IDENTITY,
	date			DATE 		NOT NULL,
	isCanceled		VARCHAR(5)		NOT NULL,
	artistId		INT			NOT NULL,
	venueId			INT		NOT NULL,
	eventTypeId			INT		NOT NULL,

	CONSTRAINT PK_eventInstanceId PRIMARY KEY (eventInstanceId),
	CONSTRAINT FK_artistId FOREIGN KEY (artistId) REFERENCES Artist(artistId),
	CONSTRAINT FK_venueId FOREIGN KEY (venueId) REFERENCES Venue(venueId),
	CONSTRAINT FK_eventTypeId FOREIGN KEY (eventTypeId) REFERENCES EventType(eventTypeId),
	CONSTRAINT C_isCanceled	CHECK (isCanceled IN ('true', 'false')),
);

CREATE TABLE PickUpLocation
(
	pickUpLocationId	INT		NOT NULL IDENTITY,
	location			VARCHAR(20) 		NOT NULL,

	CONSTRAINT FK_eventInstanceId PRIMARY KEY (pickUpLocationId),
	CONSTRAINT C_location	CHECK (location IN ('hobart town house', 'hobart library')),
);

CREATE TABLE Ticket
(
	ticketId		INT		NOT NULL IDENTITY,
	price			INTEGER 		NOT NULL,
	amountOfTicketsAvailable		INTEGER		NOT NULL,
	ticketsSold		INTEGER			NOT NULL,
	eventInstanceId	INT		NOT NULL,

	CONSTRAINT PK_ticketId PRIMARY KEY (ticketId),
	CONSTRAINT FK_eventInstanceId2 FOREIGN KEY (eventInstanceId) REFERENCES EventInstance(eventInstanceId),
);

CREATE TABLE Booking
(
	bookingNumber	INT		NOT NULL IDENTITY,
	clientPhoneNumber	VARCHAR(20)		NOT NULL,
	bookingDate		DATE			NOT NULL,
	totalPrice		INTEGER 		NOT NULL,
	paid			VARCHAR(5)		NOT NULL,
	ticketId		INT		NOT NULL,
	pickUpLocationId	INT		NOT NULL,

	CONSTRAINT PK_bookingNumber PRIMARY KEY (bookingNumber),
	CONSTRAINT C_paid	CHECK (paid IN ('true', 'false')),
	CONSTRAINT FK_ticketId FOREIGN KEY (ticketId) REFERENCES Ticket(ticketId),
	CONSTRAINT FK_pickUpLocationId FOREIGN KEY (pickUpLocationId) REFERENCES PickUpLocation(pickUpLocationId),

);






