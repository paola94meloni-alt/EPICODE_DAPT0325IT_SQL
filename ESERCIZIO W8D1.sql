#Crea una tabella Store per la gestione degli store (ID, nome, data apertura, ecc.) 
#Crea una tabella Region per la gestione delle aree geografiche (ID, città, regione, area geografica, …) 
#Popola le tabelle con pochi record esemplificativi

CREATE DATABASE NEGOZIO;
USE NEGOZIO;
CREATE TABLE REGION (
IDCitta INT auto_increment PRIMARY KEY,
NomeCitta VARCHAR (100),
Regione VARCHAR (100),
Provincia VARCHAR (100),
CAP VARCHAR (100)
);
INSERT INTO REGION (NomeCitta, Regione, Provincia, CAP)
VALUES
('Olbia', 'Sardegna', 'Sassari', '07026'),
  ('Budoni', 'Sardegna', 'Nuoro', '08100'),
  ('Cagliari', 'Sardegna', 'Cagliari', '09124'),
  ('Alghero', 'Sardegna', 'Sassari', '08020'),
  ('Oristano', 'Sardegna', 'Oristano', '09170');
SELECT * FROM REGION;
CREATE TABLE STORE (
IDStore INT auto_increment PRIMARY KEY,
Nome varchar (100),
DataApertura date,
IndirizzoEmail varchar (100),
Responsabile varchar (100),
Indirizzo varchar (100),
IDCitta int,
FOREIGN KEY (IDCitta) REFERENCES REGION (IDCitta)
);
INSERT INTO STORE (Nome, DataApertura, IndirizzoEmail, Responsabile, Indirizzo, IDCitta)
VALUES
('Emporio Sardegna', '2021-06-15', 'info@emporiosardegna.it', 'Giulia Serra', 'Via Nazionale 12', 1),
('Boutique MareBlu', '2022-03-10', 'mareblu@boutique.it', 'Luca Piras', 'Viale del Mare 45', 2),
('Sapori di Sardegna', '2020-11-05', 'contatti@saporidisardegna.it', 'Francesca Loi', 'Corso Italia 8', 3),
('Artigianato Budoni', '2023-08-01', 'artigianato@budoni.store', 'Marco Melis', 'Via Roma 101', 2),
('Stile Mediterraneo', '2021-09-20', 'stilemed@negozi.it', 'Elena Deiana', 'Piazza Garibaldi 3', 4);
SELECT * FROM STORE;

#Esegui operazioni di aggiornamento, modifica ed eliminazione record.

START TRANSACTION; 
UPDATE REGION
SET NomeCitta = 'Sassari', Provincia = 'Sassari', CAP = '08896'
WHERE IDCitta = 5;
SELECT * FROM REGION;
COMMIT;

START TRANSACTION;
DELETE FROM STORE 
WHERE IDStore = 5;
SELECT * FROM STORE;
COMMIT;

INSERT INTO STORE (Nome, DataApertura, IndirizzoEmail, Responsabile, Indirizzo, IDCitta)
VALUES
('Gusto Sardo', '2024-04-12', 'info@gustosardo.it', 'Antonio Frau', 'Via delle Erbe 22', 5);
SELECT * FROM STORE;