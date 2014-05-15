PRAGMA foreign_keys = ON;

INSERT INTO Equipa values('BLACKWHITE','B&W');
INSERT INTO Equipa values('HORSEPOWER','HP');
INSERT INTO Equipa values('BOARDERS','BRS');
INSERT INTO Equipa values('CHESSERS','CSS');
INSERT INTO Equipa values('MATES','MTS');

INSERT INTO TipoJogo values('Xadrez');
INSERT INTO TipoJogo values('Damas');
INSERT INTO TipoJogo values('Mikado');
INSERT INTO TipoJogo values('The4Mazes');
INSERT INTO TipoJogo values('Sueca');

INSERT INTO Pais values('Gana');
INSERT INTO Pais values('Senegal');
INSERT INTO Pais values('Irao');
INSERT INTO Pais values('Jamaica');
INSERT INTO Pais values('Grecia');
INSERT INTO Pais values('Portugal');
INSERT INTO Pais values('Eslovenia');
INSERT INTO Pais values('Espanha');
INSERT INTO Pais values('Brasil');

INSERT INTO Cidade values(1,'Acra','Gana');
INSERT INTO Cidade values(2,'Dakar','Senegal');
INSERT INTO Cidade values(3,'Teerao','Irao');
INSERT INTO Cidade values(4,'Kingston','Jamaica');
INSERT INTO Cidade values(5,'Atenas','Grecia');

INSERT INTO Escalao values('Minis');
INSERT INTO Escalao values('Iniciados');
INSERT INTO Escalao values('Cadetes');
INSERT INTO Escalao values('Juniors');
INSERT INTO Escalao values('Seniors');

INSERT INTO Patrocinador values('Nike');
INSERT INTO Patrocinador values('PastaCouto');
INSERT INTO Patrocinador values('Sonai');
INSERT INTO Patrocinador values('Nestle');
INSERT INTO Patrocinador values('F.C.Porto');

INSERT INTO Extensao values (1,'100');
INSERT INTO Extensao values (2,'200');
INSERT INTO Extensao values (3,'300');
INSERT INTO Extensao values (4,'400');

INSERT INTO Jogador values (0,'Ricardo','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Portugal', 1, 1, 'ricardo@gmail.com');
INSERT INTO Jogador values (1,'Manuel','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Eslovenia', 2, 2, 'manuel@gmail.com');
INSERT INTO Jogador values (2,'Joao','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Espanha', 3, 3, 'joao@gmail.com');
INSERT INTO Jogador values (3,'Maria','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Portugal', 4, 2, 'maria@gmail.com');
INSERT INTO Jogador values (4,'Joana','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Brasil', 5, 1, 'joana@gmail.com');

INSERT INTO JogadorEquipa values ('BLACKWHITE', 0);
INSERT INTO JogadorEquipa values ('HORSEPOWER', 1);
INSERT INTO JogadorEquipa values ('BOARDERS', 2);
INSERT INTO JogadorEquipa values ('CHESSERS', 3);
INSERT INTO JogadorEquipa values ('MATES', 4);

INSERT INTO Arbitro values (1,'Ricardo','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Portugal', 1, 1, ' ');
INSERT INTO Arbitro values (2,'Manuel','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Eslovenia', 2, 2, ' ');
INSERT INTO Arbitro values (3,'Joao','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Espanha', 3, 3, ' ');
INSERT INTO Arbitro values (4,'Maria','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Portugal', 4, 1, ' ');
INSERT INTO Arbitro values (5,'Joana','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Brasil', 5, 4, ' ');

INSERT INTO LocalEncontro values(1, 1, 1, '5700', 'Rua Herculano', '224446677');
INSERT INTO LocalEncontro values(2, 2, 2, '5700', 'Rua Alberto', '224446677');
INSERT INTO LocalEncontro values(3, 3, 3, '5700', 'Rua da Campainha', '224446677');
INSERT INTO LocalEncontro values(4, 4, 3, '5700', 'Rua Afonsina', '224446677');
INSERT INTO LocalEncontro values(5, 5, 4, '5700', 'Rua da Travessa', '224446677');

INSERT INTO Torneio values (1, 'Torneio Xadrez', '2013/2014', 'equipas', 'Xadrez');
INSERT INTO Torneio values (2, 'Torneio Damas', '2013/2014', 'individual', 'Damas');
INSERT INTO Torneio values (3, 'Torneio Mikado', '2013/2014', 'equipas', 'Mikado');
INSERT INTO Torneio values (4, 'Torneio The4Mazes', '2013/2014', 'individual', 'The4Mazes');
INSERT INTO Torneio values (5, 'Torneio Sueca', '2013/2014', 'equipas', 'Sueca');

INSERT INTO Partida values (1, 1, 1, 'Minis', '11/3/2014', 10);
INSERT INTO Partida values (2, 2, 2, 'Iniciados', '12/3/2014', 20);
INSERT INTO Partida values (3, 3, 3, 'Cadetes', '13/3/2014', 12);
INSERT INTO Partida values (4, 4, 4, 'Juniors', '14/3/2014', 5);
INSERT INTO Partida values (5, 5, 5, 'Seniors', '15/3/2014', 25);

INSERT INTO ArbitroPartida values (1, 1);
INSERT INTO ArbitroPartida values (2, 2);
INSERT INTO ArbitroPartida values (3, 3);
INSERT INTO ArbitroPartida values (4, 4);
INSERT INTO ArbitroPartida values (5, 5);

-- Xadrez
INSERT INTO EquipaPartida values ('BLACKWHITE',1,1,1);
INSERT INTO EquipaPartida values ('HORSEPOWER',1,2,0);
-- Damas
INSERT INTO EquipaPartida values ('HORSEPOWER',2,1,1);
INSERT INTO EquipaPartida values ('BOARDERS',2,2,0);
-- Mikado
INSERT INTO EquipaPartida values ('CHESSERS',3,1,20);
INSERT INTO EquipaPartida values ('BLACKWHITE',3,2,18);
INSERT INTO EquipaPartida values ('BOARDERS',3,3,10);
INSERT INTO EquipaPartida values ('MATES',3,4,7);
-- The4Mazes
INSERT INTO EquipaPartida values ('HORSEPOWER',4,1,10);
INSERT INTO EquipaPartida values ('MATES',4,2,20);
-- Sueca
INSERT INTO EquipaPartida values ('CHESSERS',5,1,4);
INSERT INTO EquipaPartida values ('MATES',5,1,4);

INSERT INTO EquipaPatrocinadorTorneio values ('BLACKWHITE', 'Nike', 1);
INSERT INTO EquipaPatrocinadorTorneio values ('HORSEPOWER', 'PastaCouto', 2);
INSERT INTO EquipaPatrocinadorTorneio values ('BOARDERS', 'Sonai', 3);
INSERT INTO EquipaPatrocinadorTorneio values ('CHESSERS', 'Nestle', 4);
INSERT INTO EquipaPatrocinadorTorneio values ('MATES', 'F.C.Porto', 5);

INSERT INTO ArbitroTipoJogo values(1,'Xadrez');
INSERT INTO ArbitroTipoJogo values(1,'Sueca');
INSERT INTO ArbitroTipoJogo values(1,'Damas');
INSERT INTO ArbitroTipoJogo values(3,'Mikado');
INSERT INTO ArbitroTipoJogo values(4,'The4Mazes');
INSERT INTO ArbitroTipoJogo values(5,'Sueca');
