CREATE DATABASE Gestion_club_jeux_video ;
use Gestion_club_jeux_video ;
CREATE TABLE Abonnement (
id INT PRIMARY KEY  ,
type_abonnement VARCHAR(30)  ,
date_debut DATE  ,
date_fin DATE
);
CREATE TABLE Membre(
id INT PRIMARY KEY auto_increment ,
pseudo varchar(30) Not Null Unique ,
email varchar (250) Not Null unique ,
date_inscription Date Not Null ,
abonnement_id INT ,
foreign key(abonnement_id) references Abonnement( id )
);
CREATE TABLE Tournoi(
id INT PRIMARY KEY auto_increment ,
nom_tournoi varchar(50),
date_tournoi Date ,
recompenses  varchar(100)
) auto_increment = 1000;

CREATE TABLE Participe (
score INT ,
range_final INT ,
member_id INT ,
tournoi_id INT ,
FOREIGN KEY(member_id) REFERENCES Membre(id) ,
FOREIGN KEY(tournoi_id) REFERENCES Tournoi(id) 
);

CREATE TABLE Jeu (
id INT PRIMARY KEY auto_increment ,
titre VARCHAR(50) NOT NULL Unique ,
studio_developement VARCHAR(100) NOT NULL ,
anne_sortie DATE NOT NULL ,
genre VARCHAR(30), 
multijoueur boolean ,
tournoi_id INT ,
FOREIGN KEY(tournoi_id) REFERENCES Tournoi(id) 
);

CREATE TABLE Emprunter (
date_emprunt Date ,
date_retour_prevue Date ,
date_retour_reelle Date ,
member_id INT ,
jeu_id INT ,
FOREIGN KEY(member_id) REFERENCES Membre(id) ,
FOREIGN KEY(jeu_id) REFERENCES Jeu(id) 
);
ALTER table Emprunter ADD id INT PRIMARY KEY auto_increment ;
/* insrtion de donner */
INSERT INTO Abonnement (id, type_abonnement, date_debut, date_fin) VALUES
(1, 'Mensuel', '2023-01-01', '2023-01-31'),
(2, 'Annuel', '2023-03-01', '2024-02-29'),
(3, 'Trimestriel', '2023-06-01', '2023-08-31'),
(4, 'Mensuel', '2023-07-01', '2023-07-31'),
(5, 'Annuel', '2023-09-01', '2024-08-31'),
(6, 'Trimestriel', '2023-10-01', '2023-12-31'),
(7, 'Mensuel', '2023-11-01', '2023-11-30');

INSERT INTO Membre (pseudo, email, date_inscription, abonnement_id) VALUES
('GamerX', 'gamerx@gmail.com', '2023-01-15', 1),
('ProPlayer', 'proplayer@gmail.com', '2023-03-10', 2),
('Challenger', 'challenger@gmail.com', '2023-06-15', 3),
('ArcadeMaster', 'arcademaster@gmail.com', '2023-07-20', NULL),
('NoobMaster', 'noobmaster@gmail.com', '2023-09-05', 5),
('RetroGamer', 'retrogamer@gmail.com', '2023-10-11', 6),
('SpeedRunner', 'speedrunner@gmail.com', '2023-11-03', 7);

INSERT INTO Tournoi (nom_tournoi, date_tournoi, recompenses) VALUES
('Summer Showdown', '2023-07-15', 'Cash Prize'),
('Winter Cup', '2023-12-20', 'Gift Cards'),
('Pro League Finals', '2023-09-25', 'Trophy'),
('Arcade Championship', '2023-06-30', 'Exclusive Gear'),
('Speedrun Fiesta', '2023-10-12', 'Medals'),
('Retro Games Tournament', '2023-08-15', 'Retro Consoles'),
('All-Stars Battle', '2023-11-20', 'Custom Merchandise');

INSERT INTO Participe (score, range_final, member_id, tournoi_id) VALUES
(2500, 1, 1, 1001),
(1500, 3, 2, 1002),
(1800, 2, 3, 1003),
(2000, 1, 4, 1004),
(1700, 2, 5, 1005),
(1300, 3, 6, 1006),
(2200, 1, 7, 10);
INSERT INTO Jeu (titre, studio_developement, anne_sortie, genre, multijoueur, tournoi_id) VALUES
('Battle Royale', 'Epic Studios', '2022-05-20', 'Action', TRUE, 1001),
('Puzzle Quest', 'Logic Masters', '2021-11-15', 'Puzzle', FALSE, NULL),
('Space Conquerors', 'Galactic Games', '2020-06-10', 'Sci-Fi', TRUE, 1002),
('Retro Racer', 'Old School Devs', '2019-03-25', 'Racing', FALSE, 1006),
('Adventure Time', 'Quest Studios', '2023-01-30', 'Adventure', TRUE, NULL),
('Mystery Manor', 'Hidden Stories', '2018-09-18', 'Mystery', FALSE, NULL),
('Speed Demons', 'Velocity Inc.', '2023-07-01', 'Racing', TRUE, 1005);

INSERT INTO Emprunter (date_emprunt, date_retour_prevue, date_retour_reelle, member_id, jeu_id) VALUES
('2023-01-20', '2023-01-30', '2023-01-29', 1, 1),
('2023-03-15', '2023-03-25', '2023-03-24', 2, 2),
('2023-06-20', '2023-06-30', '2023-06-29', 3, 3),
('2023-07-25', '2023-08-05', NULL, 4, 4),
('2023-09-10', '2023-09-20', '2023-09-19', 5, 5),
('2023-10-15', '2023-10-25', NULL, 6, 6),
('2023-11-05', '2023-11-15', NULL, 7, 7);