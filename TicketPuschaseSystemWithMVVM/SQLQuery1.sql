CREATE DATABASE TicketDB

GO

USE TicketDb

GO

CREATE TABLE Pilots(
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] nvarchar(50) NOT NULL,
[Surname] nvarchar(50) NOT NULL
)

GO
INSERT INTO Pilots([Name], [Surname])
VALUES ('Kamran', 'Karimzada'),
('Aydin', 'Hesimli'),
('Elvin', 'Camalzada')
GO

CREATE TABLE Cities(
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] nvarchar(50) not null
)

GO
INSERT INTO Cities([Name])
VALUES('Baku'),('London'),('Istanbul'),('Madrid'),('Milan'),('Marsel'),('Moscow'),('Naxcivan'), ('New York'),('Washington')
GO

CREATE TABLE Schedules(
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[StartDateTime] datetime not null,
[CityId] int NOT NULL FOREIGN KEY REFERENCES Cities(Id) ON DELETE CASCADE
)

GO
INSERT INTO Schedules([StartDateTime],[CityId])
VALUES('2023-02-20',1),('2023-02-25',1),('2023-02-28',2),('2023-03-5',2),('2023-03-5',3),('2023-03-12',3),('2023-02-25',3),
('2023-03-18',4),('2023-03-18',5),('2023-04-10',5),
('2023-04-20',5),('2023-04-25',5),('2023-02-28',6),('2023-03-5',6),('2023-03-5',7),('2023-04-12',7),('2023-04-25',8),
('2023-03-18',9),('2023-03-18',10),('2023-04-10',9),('2023-02-28',10),('2023-03-5',9)
GO

CREATE TABLE Airplanes(
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] nvarchar(50) NOT NULL,
[PassengerCount] int not null,
[PilotId] int FOREIGN KEY REFERENCES Pilots(Id) ON DELETE CASCADE,
[ScheduleId] int FOREIGN KEY REFERENCES Schedules(Id) ON DELETE CASCADE
)

SELECT * FROM Schedules
SELECT * FROM Pilots
GO
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Flamingo International Airport', 221, 3, 14);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Kamiraba Airport', 187, 1, 11);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Soroti Airport', 150, 2, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Gogebic Iron County Airport', 229, 3, 19);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Marshall Don Hunter Sr Airport', 234, 3, 9);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Santa Maria Pub/Capt G Allan Hancock Field', 105, 3, 10);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Jackson Hole Airport', 228, 3, 14);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Beica Airport', 128, 2, 5);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Springfield Branson National Airport', 179, 2, 13);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Salinas Municipal Airport', 173, 2, 7);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Tambao Airport', 188, 2, 9);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Cuito Cuanavale Airport', 194, 3, 1);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Syukuran Aminuddin Amir Airport', 136, 1, 13);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Latina Air Base', 153, 1, 4);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Isla de Tigre  Heliport', 231, 1, 17);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Sakkyryr Airport', 106, 3, 11);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Nicaro Airport', 101, 1, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Emden Airport', 208, 2, 17);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Big Creek Airport', 240, 1, 14);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Biała Podlaska Airfield', 129, 2, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Kanas Airport', 130, 2, 18);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Wellsville Municipal Arpt,Tarantine Field', 217, 3, 17);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('King Shaka International Airport', 182, 2, 2);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Jicalapa Airport', 192, 1, 17);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Murray Island Airport', 218, 3, 2);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Unalaska Airport', 124, 3, 17);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Lamap Airport', 243, 1, 9);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Sde Dov Airport', 233, 3, 9);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Nepalgunj Airport', 190, 1, 20);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Elenak Airport', 245, 1, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Baghdad International Airport', 105, 1, 7);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Mabaruma Airport', 136, 3, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Ziro Airport', 199, 3, 8);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('RAF Waddington', 177, 1, 9);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Tippi Airport', 215, 3, 9);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Mirny Airport', 113, 2, 7);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Perth International Airport', 154, 2, 2);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Whidbey Island Naval Air Station (Ault Field)', 119, 2, 18);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Frank Pais International Airport', 192, 1, 7);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Carlton Hill Airport', 153, 1, 18);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Alama Iqbal International Airport', 106, 1, 20);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Carlton Hill Airport', 197, 1, 1);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Kings Creek Airport', 119, 2, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Edson Airport', 193, 1, 4);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Pinar Del Rio Airport', 214, 1, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Busselton Regional Airport', 230, 2, 13);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Maron Island Airport', 248, 1, 11);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Mercedes Airport', 126, 3, 22);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Lutsk Airport', 108, 2, 6);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Lannion-Côte de Granit Airport', 171, 3, 1);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Buritirama Airport', 174, 3, 15);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Tanque Novo Airport', 195, 1, 2);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Auburn Lewiston Municipal Airport', 167, 3, 19);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Bielsko-Bialo Kaniow Airfield', 245, 3, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('John F Kennedy Memorial Airport', 211, 1, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Sekakes Airport', 245, 3, 2);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Oulu Airport', 132, 3, 22);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Sukkur Airport', 198, 1, 10);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Jurado Airport', 217, 2, 9);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Termas de Río Hondo international Airport', 177, 2, 11);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Haivaro Airport', 139, 3, 15);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('El Nido Airport', 209, 3, 15);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Kamalpur Airport', 244, 1, 10);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Falcon State Airport', 248, 1, 14);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Lonesome Pine Airport', 215, 3, 21);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Frans Kaisiepo Airport', 128, 1, 21);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Moengo Airstrip', 142, 3, 20);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Andulo Airport', 244, 2, 16);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Chatham Seaplane Base', 212, 2, 17);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Baniyala Airport', 189, 1, 18);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Jurado Airport', 109, 1, 18);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Lake Manyara Airport', 134, 1, 6);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Inyokern Airport', 149, 2, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Kaltag Airport', 209, 1, 9);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Boulia Airport', 125, 2, 7);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Fort Bragg Airport', 230, 3, 22);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Donoi Airport', 209, 2, 1);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Daman Airport', 111, 3, 12);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Svolvær Helle Airport', 164, 2, 6);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Spirit of St Louis Airport', 135, 2, 22);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Negril Airport', 170, 3, 22);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Yaguara Airport', 228, 3, 3);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Dolbeau St Felicien Airport', 214, 2, 18);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Liangping Airport', 199, 3, 8);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Vadodara Airport', 189, 3, 15);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Blue Canyon Nyack Airport', 155, 2, 7);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Enterprise Municipal Airport', 142, 2, 19);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Biniguni Airport', 124, 2, 16);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Buri Ram Airport', 228, 2, 6);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Hoonah Airport', 123, 3, 8);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Tuscola Area Airport', 158, 2, 13);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Lučenec Airport', 226, 1, 4);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Dryden Regional Airport', 146, 2, 14);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Marla Airport', 160, 2, 11);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Plattsburgh International Airport', 155, 3, 15);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Everett-Stewart Regional Airport', 214, 1, 7);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Storm Lake Municipal Airport', 179, 1, 1);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Chomley Seaplane Base', 105, 3, 11);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Reus Air Base', 152, 1, 18);
insert into Airplanes ([Name], [PassengerCount], [PilotId], [ScheduleId]) values ('Selebi Phikwe Airport', 136, 2, 6);

GO

CREATE TABLE Passengers(
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[Name] nvarchar(30) not null, 
[Surname] nvarchar(30) not null,
[Gender] bit  not null,
[BirthDay] datetime2 not null
)
 

GO

CREATE TABLE Tickets(
[Id] int PRIMARY KEY IDENTITY(1,1) NOT NULL,
[CityId] int not null FOREIGN KEY REFERENCES Cities(Id) ,
[ScheduleId] int not null FOREIGN KEY REFERENCES Schedules(Id),
[AirplaneId] int not null FOREIGN KEY REFERENCES Airplanes(Id),
[PassengerId] int not null FOREIGN KEY REFERENCES Passengers(Id) ON DELETE CASCADE
)


GO

