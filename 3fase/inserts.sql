PRAGMA foreign_keys = ON;

INSERT INTO Equipa values(NULL,'BLACKWHITE','B&W');
INSERT INTO Equipa values(NULL,'DAREDEVILS','DD');
INSERT INTO Equipa values(NULL,'ELHERMANOS','EH');
INSERT INTO Equipa values(NULL,'CHESSERS','CSS');
INSERT INTO Equipa values(NULL,'GODMODE','GDM');
INSERT INTO Equipa values(NULL,'NONOISE','NN');
INSERT INTO Equipa values(NULL,'NINJAS','NJS');

INSERT INTO TipoJogo values(NULL,'Xadrez');
INSERT INTO TipoJogo values(NULL,'Damas');
INSERT INTO TipoJogo values(NULL,'Mikado');
INSERT INTO TipoJogo values(NULL,'The4Mazes');
INSERT INTO TipoJogo values(NULL,'Sueca');
INSERT INTO TipoJogo values(NULL,'Epaminondas');
INSERT INTO TipoJogo values(NULL,'Quatro em Linha');

INSERT INTO Pais values(NULL,'Gana');
INSERT INTO Pais values(NULL,'Senegal');
INSERT INTO Pais values(NULL,'Irao');
INSERT INTO Pais values(NULL,'Jamaica');
INSERT INTO Pais values(NULL,'Grecia');
INSERT INTO Pais values(NULL,'Portugal');
INSERT INTO Pais values(NULL,'Eslovenia');
INSERT INTO Pais values(NULL,'Espanha');
INSERT INTO Pais values(NULL,'Brasil');

INSERT INTO Cidade values(NULL,'Acra',1);
INSERT INTO Cidade values(NULL,'Dakar',2);
INSERT INTO Cidade values(NULL,'Teerão',3);
INSERT INTO Cidade values(NULL,'Kingston',4);
INSERT INTO Cidade values(NULL,'Atenas',5);
INSERT INTO Cidade values(NULL,'Lisboa',6);
INSERT INTO Cidade values(NULL,'Ljubljana',7);
INSERT INTO Cidade values(NULL,'Madrid',8);
INSERT INTO Cidade values(NULL,'Brasília',9);

INSERT INTO Escalao values(NULL,'Minis');
INSERT INTO Escalao values(NULL,'Iniciados');
INSERT INTO Escalao values(NULL,'Cadetes');
INSERT INTO Escalao values(NULL,'Juniors');
INSERT INTO Escalao values(NULL,'Seniors');

INSERT INTO Patrocinador values(NULL,'Nike');
INSERT INTO Patrocinador values(NULL,'Adidas');
INSERT INTO Patrocinador values(NULL,'Sonai');
INSERT INTO Patrocinador values(NULL,'Nestle');
INSERT INTO Patrocinador values(NULL,'Benfica');
INSERT INTO Patrocinador values(NULL,'Sporting');
INSERT INTO Patrocinador values(NULL,'Porto');

INSERT INTO Extensao values (NULL,'233');
INSERT INTO Extensao values (NULL,'221');
INSERT INTO Extensao values (NULL,'98');
INSERT INTO Extensao values (NULL,'1876');
INSERT INTO Extensao values (NULL,'30');
INSERT INTO Extensao values (NULL,'351');
INSERT INTO Extensao values (NULL,'386');
INSERT INTO Extensao values (NULL,'34');
INSERT INTO Extensao values (NULL,'55');

INSERT INTO Formato values (NULL,'individual');
INSERT INTO Formato values (NULL,'equipa');
INSERT INTO Formato values (NULL,'um contra todos');
INSERT INTO Formato values (NULL,'sozinho');

INSERT INTO Jogador values (NULL,'Ricardo','1290','2/11/1960','nº 10 andar 9','Rua dos Fósforos', '916010187', 1, 1, 1, 'ricardo@gmail.com');
INSERT INTO Jogador values (NULL,'Manuel','2200','1/3/1973','40','Rua Quinta de Campainha', '916010223', 3, 2, 2, 'manuel10@gmail.com');
INSERT INTO Jogador values (NULL,'João','3310','2/5/1992','1','Rua do Matagalo', '916010139', 1, 3, 3, 'joao99@gmail.com');
INSERT INTO Jogador values (NULL,'Maria','4360','3/5/1973','3','Travessa do Freixo', '81585987', 4, 6, 2, 'maria1023@gmail.com');
INSERT INTO Jogador values (NULL,'Joana','5350','9/6/1996','100','Rua do Bolo do Caco', '015010207', 5, 9, 1, 'joanaxorg@gmail.com');
INSERT INTO Jogador values (NULL,'Alberto','6350','9/12/1987','198','Rua da Bananeira', '212010223', 7, 5, 1, 'albertooguerreiro@gmail.com');
INSERT INTO Jogador values (NULL,'Gonçalo','8390','7/8/1984','1827','Rua da Poncha', '102010229', 2, 4, 1, 'goncalo@gmail.com');
INSERT INTO Jogador values (NULL,'Cristiano','9700','6/7/1988','123','Beco da Velha', '616010216', 6, 6, 1, 'cristian7@gmail.com');
INSERT INTO Jogador values (NULL,'André','10750','23/7/1983','98','Rua dos Sapateiros', '116010119', 8, 7, 6, 'andreandreandrade@gmail.com');
INSERT INTO Jogador values (NULL,'Marta','11019','9/7/1979','231','Rua Maria dos Sapos', '426005823', 9, 8, 8, 'martinha@gmail.com');
INSERT INTO Jogador values (NULL,'Vitória','12992','6/12/1984','98','Beco das Granadas', '525121123', 6, 1, 1, 'vitoriaaa@gmail.com');
INSERT INTO Jogador values (NULL,'Victor','12992','9/9/1990','98','Beco das Granadas', '525121122', 6, 1, 1, 'vitoriaaa@gmail.com');

INSERT INTO JogadorEquipa values (12, 7);
INSERT INTO JogadorEquipa values (11, 7);
INSERT INTO JogadorEquipa values (10, 6);
INSERT INTO JogadorEquipa values (9, 6);
INSERT INTO JogadorEquipa values (8, 5);
INSERT INTO JogadorEquipa values (7, 5);
INSERT INTO JogadorEquipa values (5, 5);
INSERT INTO JogadorEquipa values (8, 4);
INSERT INTO JogadorEquipa values (7, 4);
INSERT INTO JogadorEquipa values (4, 3);
INSERT INTO JogadorEquipa values (3, 2);
INSERT INTO JogadorEquipa values (5, 4);
INSERT INTO JogadorEquipa values (5, 4);
INSERT INTO JogadorEquipa values (2, 1);
INSERT INTO JogadorEquipa values (1, 1);

INSERT INTO Arbitro values (NULL,'Marco','13300','20/7/1961','102','Rua do Papel', '916010182', 1, 1, 1, '');
INSERT INTO Arbitro values (NULL,'Nobre','4450','13/6/1977','numero 102 andar 2123','Rua Quinta de Campainha', '916010223', 1, 2, 3, '');
INSERT INTO Arbitro values (NULL,'Asdrubal','1-2300','12/6/1949','4','Rua Quinta de Campainha', '916010223', 5, 1, 1, '');
INSERT INTO Arbitro values (NULL,'Pedro','03-1334','25/8/1976','5','Rua do Pão Duro', '916010223', 7, 7, 6, '');
INSERT INTO Arbitro values (NULL,'Fernando','3134-121','7/11/1981','6','Rua das Delícias', '916010223', 4, 4, 4, '');
INSERT INTO Arbitro values (NULL,'Duarte','3032','11/8/1966','8','Rua Maria Lurdes', '916010223', 2, 2, 2, '');
INSERT INTO Arbitro values (NULL,'Nelson','0313','11/8/1961','4','Rua da Alegria', '916010223', 8, 5, 6, '');

INSERT INTO LocalEncontro values(1, 1, 1, '569', 'Rua Herculano', '211446664');
INSERT INTO LocalEncontro values(2, 2, 2, '710', 'Rua Alberto', '244660077');
INSERT INTO LocalEncontro values(3, 3, 3, '291', 'Rua da Campainha', '124446677');
INSERT INTO LocalEncontro values(4, 4, 3, '520', 'Rua Afonsina', '223446777');
INSERT INTO LocalEncontro values(5, 5, 4, '1200', 'Rua da Travessa', '125446677');

INSERT INTO Torneio values (NULL, 'Torneio Xadrez', '2013/2014', 1, 1);
INSERT INTO Torneio values (NULL, 'Torneio Damas', '2013/2014', 2, 2);
INSERT INTO Torneio values (NULL, 'Torneio Mikado', '2013/2014', 2, 3);
INSERT INTO Torneio values (NULL, 'Torneio The4Mazes', '2013/2014', 2, 4);
INSERT INTO Torneio values (NULL, 'Torneio Sueca', '2013/2014', 3, 5);
INSERT INTO Torneio values (NULL, 'Torneio Epaminondas', '2013/2014', 3, 6);
INSERT INTO Torneio values (NULL, 'Torneio Quatro em Linha', '2013/2014', 3, 7);

INSERT INTO Partida values (NULL, 1, 1, 1, '10/2/2013', 10);
INSERT INTO Partida values (NULL, 1, 1, 1, '11/2/2013', 15);
INSERT INTO Partida values (NULL, 1, 1, 1, '12/2/2013', 20);
INSERT INTO Partida values (NULL, 3, 2, 2, '12/2/2013', 45);
INSERT INTO Partida values (NULL, 2, 5, 2, '12/2/2013', 5);

INSERT INTO ArbitroPartida values (1, 1);
INSERT INTO ArbitroPartida values (1, 2);
INSERT INTO ArbitroPartida values (1, 3);
INSERT INTO ArbitroPartida values (2, 4);
INSERT INTO ArbitroPartida values (5, 5);

-- Xadrez
INSERT INTO EquipaPartida values (7,1,1,1998);
INSERT INTO EquipaPartida values (6,1,2,1900);
INSERT INTO EquipaPartida values (6,2,2,2150);
INSERT INTO EquipaPartida values (3,2,1,2191);
INSERT INTO EquipaPartida values (7,3,1,2152);
INSERT INTO EquipaPartida values (3,3,2,2121);
-- Mikado
INSERT INTO EquipaPartida values (5,4,1,1895);
INSERT INTO EquipaPartida values (4,4,2,1864);
-- Sueca
INSERT INTO EquipaPartida values (2,5,2,1795);
INSERT INTO EquipaPartida values (1,5,1,1964);

INSERT INTO EquipaPatrocinadorTorneio values (7,1,1);
INSERT INTO EquipaPatrocinadorTorneio values (7,2,1);
INSERT INTO EquipaPatrocinadorTorneio values (7,3,1);
INSERT INTO EquipaPatrocinadorTorneio values (7,4,1);
INSERT INTO EquipaPatrocinadorTorneio values (7,5,1);
INSERT INTO EquipaPatrocinadorTorneio values (7,6,1);
INSERT INTO EquipaPatrocinadorTorneio values (7,7,1);

INSERT INTO EquipaPatrocinadorTorneio values (3,1,1);
INSERT INTO EquipaPatrocinadorTorneio values (3,5,1);
INSERT INTO EquipaPatrocinadorTorneio values (3,3,1);

INSERT INTO EquipaPatrocinadorTorneio values (6,2,1);
INSERT INTO EquipaPatrocinadorTorneio values (6,3,1);

INSERT INTO EquipaPatrocinadorTorneio values (5,1,2);
INSERT INTO EquipaPatrocinadorTorneio values (5,5,2);
INSERT INTO EquipaPatrocinadorTorneio values (5,4,2);

INSERT INTO EquipaPatrocinadorTorneio values (4,1,2);
INSERT INTO EquipaPatrocinadorTorneio values (4,2,2);

INSERT INTO EquipaPatrocinadorTorneio values (1,6,5);
INSERT INTO EquipaPatrocinadorTorneio values (1,7,5);

INSERT INTO EquipaPatrocinadorTorneio values (2,1,5);

INSERT INTO ArbitroTipoJogo values(1,1);
INSERT INTO ArbitroTipoJogo values(2,2);
INSERT INTO ArbitroTipoJogo values(3,3);
INSERT INTO ArbitroTipoJogo values(4,4);
INSERT INTO ArbitroTipoJogo values(5,5);
INSERT INTO ArbitroTipoJogo values(6,6);
INSERT INTO ArbitroTipoJogo values(7,7);
