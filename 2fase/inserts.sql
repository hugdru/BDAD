PRAGMA foreign_keys = ON;

INSERT INTO Equipa values('BLACKWHITE','B&W');
INSERT INTO Equipa values('HORSEPOWER','HP');
INSERT INTO Equipa values('BOARDERS','BRS');
INSERT INTO Equipa values('CHESSERS','CSS');
INSERT INTO Equipa values('MATES','MTS');

INSERT INTO TipoJogo values('Xadrez');
INSERT INTO TipoJogo values('Damas');
INSERT INTO TipoJogo values('Micado');
INSERT INTO TipoJogo values('The4Maze');
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

INSERT INTO Cidade values(null,'Acra','Gana');
INSERT INTO Cidade values(null,'Dakar','Senegal');
INSERT INTO Cidade values(null,'Teerao','Irao');
INSERT INTO Cidade values(null,'Kingston','Jamaica');
INSERT INTO Cidade values(null,'Atenas','Grecia');

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

INSERT INTO Extensao values (null,'100');
INSERT INTO Extensao values (null,'200');
INSERT INTO Extensao values (null,'300');
INSERT INTO Extensao values (null,'400');

INSERT INTO Jogador values (null,'Ricardo','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Portugal', '1', '1', 'ricardo@gmail.com');
INSERT INTO Jogador values (null,'Manuel','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Eslovenia', '2', '2', 'manuel@gmail.com');
INSERT INTO Jogador values (null,'Joao','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Espanha', '3', '3', 'joao@gmail.com');
INSERT INTO Jogador values (null,'Maria','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Portugal', '4', '2', 'maria@gmail.com');
INSERT INTO Jogador values (null,'Joana','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Brasil', '5', '1', 'joana@gmail.com');

INSERT INTO JogadorEquipa values ('BLACKWHITE', '0');
INSERT INTO JogadorEquipa values ('HORSEPOWER', '1');
INSERT INTO JogadorEquipa values ('BOARDERS', '2');
INSERT INTO JogadorEquipa values ('CHESSERS', '3');
INSERT INTO JogadorEquipa values ('MATES', '4');

INSERT INTO Arbitro values (null,'Ricardo','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Portugal', '1', '1', ' ');
INSERT INTO Arbitro values (null,'Manuel','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Eslovenia', '2', '2', ' ');
INSERT INTO Arbitro values (null,'Joao','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Espanha', '3', '3', ' ');
INSERT INTO Arbitro values (null,'Maria','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Portugal', '4', '1', ' ');
INSERT INTO Arbitro values (null,'Joana','4300','9/10/1993','4','Rua Quinta de Campainha', '916010223', 'Brasil', '5', '4', ' ');

INSERT INTO LocalEncontro values(null, '0', '100', '5700', 'Rua Herculano', '224446677');
INSERT INTO LocalEncontro values(null, '1', '200', '5700', 'Rua Alberto', '224446677');
INSERT INTO LocalEncontro values(null, '2', '300', '5700', 'Rua da Campainha', '224446677');
INSERT INTO LocalEncontro values(null, '3', '400', '5700', 'Rua Afonsina', '224446677');
INSERT INTO LocalEncontro values(null, '4', '500', '5700', 'Rua da Travessa', '224446677');

INSERT INTO ArbitroTipoJogo values ('1','Xadrez');
INSERT INTO ArbitroTipoJogo values ('2','Damas');
INSERT INTO ArbitroTipoJogo values ('3','Micado');
INSERT INTO ArbitroTipoJogo values ('4','The4Maze');
INSERT INTO ArbitroTipoJogo values ('5','Sueca');

INSERT INTO Partida values (null, 'Minis', '11/3/2014', '120');
INSERT INTO Partida values (null, 'Iniciados', '12/3/2014', '120');
INSERT INTO Partida values (null, 'Cadetes', '13/3/2014', '120');
INSERT INTO Partida values (null, 'Juniors', '14/3/2014', '120');
INSERT INTO Partida values (null, 'Seniors', '15/3/2014', '120');

INSERT INTO ArbitroPartida values ('1', '1');
INSERT INTO ArbitroPartida values ('2', '2');
INSERT INTO ArbitroPartida values ('3', '3');
INSERT INTO ArbitroPartida values ('4', '4');
INSERT INTO ArbitroPartida values ('5', '5');

INSERT INTO EquipaPartida('BLACKWHITE','1','1','4');
INSERT INTO EquipaPartida('HORSEPOWER','1','1','4');
INSERT INTO EquipaPartida('BOARDERS','1','1','4');
INSERT INTO EquipaPartida('CHESSERS','1','1','4');
INSERT INTO EquipaPartida('MATES','1','1','4');

INSERT INTO EquipaPatrocinadorTorneio values ('BLACKWHITE', 'Nike', '1');
INSERT INTO EquipaPatrocinadorTorneio values ('HORSEPOWER', 'PastaCouto', '2');
INSERT INTO EquipaPatrocinadorTorneio values ('BOARDERS', 'Sonai', '3');
INSERT INTO EquipaPatrocinadorTorneio values ('CHESSERS', 'Nestle', '4');
INSERT INTO EquipaPatrocinadorTorneio values ('MATES', 'F.C.Porto', '5');

INSERT INTO Torneio values (null, 'Torneio1', '2013/2014', 'equipas', 'Xadrez');
INSERT INTO Torneio values (null, 'Torneio2', '2013/2014', 'individual', 'Damas');
INSERT INTO Torneio values (null, 'Torneio3', '2013/2014', 'equipas', 'Micado');
INSERT INTO Torneio values (null, 'Torneio4', '2013/2014', 'individual', 'The4Mazes');
INSERT INTO Torneio values (null, 'Torneio5', '2013/2014', 'equipas', 'Sueca');
