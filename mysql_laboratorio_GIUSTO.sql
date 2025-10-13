create database LABORATORIO;
USE LABORATORIO;
CREATE TABLE clienti (
	clienteID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    indirizzo varchar(50),
    tipo_azienda varchar(50)
    );
insert into clienti (nome,indirizzo,tipo_azienda)
values ("Le Rose", "Via Mare, 11, Cagliari", "Albergo"),
("Pet food", "Via delle ortensie, 4, Sassari", "Azienda produttrice di mangimi");
#vedo cosa c'è nella tabella clienti
select*from clienti;
Create table campioni (
numero_accettazione int auto_increment primary key,
data_accettazione date,
tipologia_campione varchar (50),
num_aliquote int,
clienteID int,
FOREIGN KEY (CLIENTEID) REFERENCES CLIENTI (CLIENTEID)
);
insert into campioni (data_accettazione,tipologia_campione,num_aliquote,clienteID)
values ('2025-10-10', 'Acqua', 1, 1),
('2025-10-11', 'farina di pesce', 3, 2);
SELECT*FROM CAMPIONI;
create table analisi (
data_analisi date,
codice_analisi int,
numero_accettazione int,
strumento varchar (50),
analista varchar (50),
FOREIGN KEY (NUMERO_ACCETTAZIONE) REFERENCES CAMPIONI (NUMERO_ACCETTAZIONE)
);
insert into analisi (data_analisi,codice_analisi,numero_accettazione,strumento,analista)
values ('2025-10-10', 1, 1,'PHmetro','Paola'),
('2025-10-12', 2, 2,'NIR', 'Elisa');
SELECT*FROM ANALISI;
