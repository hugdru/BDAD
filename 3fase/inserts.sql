PRAGMA foreign_keys = ON;

DELETE FROM Pais;
DELETE FROM Cidade;
DELETE FROM Extensao;
DELETE FROM Arbitro;
DELETE FROM Jogador;
DELETE FROM Equipa;
DELETE FROM JogadorEquipa;
DELETE FROM TipoJogo;
DELETE FROM ArbitroTipoJogo;
DELETE FROM LocalEncontro;
DELETE FROM Escalao;
DELETE FROM EquipaPartida;
DELETE FROM ArbitroPartida;
DELETE FROM Patrocinador;
DELETE FROM EquipaPatrocinadorTorneio;
DELETE FROM Torneio;
DELETE FROM Formato;

INSERT INTO Equipa VALUES (NULL,'BLACKWHITE','B&W');
INSERT INTO Equipa VALUES (NULL,'DAREDEVILS','DD');
INSERT INTO Equipa VALUES (NULL,'LOSHERMANOS','EH');
INSERT INTO Equipa VALUES (NULL,'CHESSERS','CSS');
INSERT INTO Equipa VALUES (NULL,'GODMODE','GDM');
INSERT INTO Equipa VALUES (NULL,'NONOISE','NN');
INSERT INTO Equipa VALUES (NULL,'NINJAS','NJS');

INSERT INTO TipoJogo VALUES (NULL,'Xadrez');
INSERT INTO TipoJogo VALUES (NULL,'Damas');
INSERT INTO TipoJogo VALUES (NULL,'Mikado');
INSERT INTO TipoJogo VALUES (NULL,'The4Mazes');
INSERT INTO TipoJogo VALUES (NULL,'Sueca');
INSERT INTO TipoJogo VALUES (NULL,'Epaminondas');
INSERT INTO TipoJogo VALUES (NULL,'Quatro em Linha');

INSERT INTO Pais VALUES (NULL,'Gana');
INSERT INTO Pais VALUES (NULL,'Senegal');
INSERT INTO Pais VALUES (NULL,'Irao');
INSERT INTO Pais VALUES (NULL,'Jamaica');
INSERT INTO Pais VALUES (NULL,'Grecia');
INSERT INTO Pais VALUES (NULL,'Portugal');
INSERT INTO Pais VALUES (NULL,'Eslovenia');
INSERT INTO Pais VALUES (NULL,'Espanha');
INSERT INTO Pais VALUES (NULL,'Brasil');

INSERT INTO Cidade VALUES (NULL,'Acra',1);
INSERT INTO Cidade VALUES (NULL,'Dakar',2);
INSERT INTO Cidade VALUES (NULL,'Teerão',3);
INSERT INTO Cidade VALUES (NULL,'Kingston',4);
INSERT INTO Cidade VALUES (NULL,'Atenas',5);
INSERT INTO Cidade VALUES (NULL,'Lisboa',6);
INSERT INTO Cidade VALUES (NULL,'Ljubljana',7);
INSERT INTO Cidade VALUES (NULL,'Madrid',8);
INSERT INTO Cidade VALUES (NULL,'Brasília',9);

INSERT INTO Escalao VALUES (NULL,'Minis');
INSERT INTO Escalao VALUES (NULL,'Iniciados');
INSERT INTO Escalao VALUES (NULL,'Cadetes');
INSERT INTO Escalao VALUES (NULL,'Juniors');
INSERT INTO Escalao VALUES (NULL,'Seniors');

INSERT INTO Patrocinador VALUES (NULL,'Nike');
INSERT INTO Patrocinador VALUES (NULL,'Adidas');
INSERT INTO Patrocinador VALUES (NULL,'Sonai');
INSERT INTO Patrocinador VALUES (NULL,'Nestle');
INSERT INTO Patrocinador VALUES (NULL,'Benfica');
INSERT INTO Patrocinador VALUES (NULL,'Sporting');
INSERT INTO Patrocinador VALUES (NULL,'Porto');

INSERT INTO Extensao VALUES (NULL,'233');
INSERT INTO Extensao VALUES (NULL,'221');
INSERT INTO Extensao VALUES (NULL,'98');
INSERT INTO Extensao VALUES (NULL,'1876');
INSERT INTO Extensao VALUES (NULL,'30');
INSERT INTO Extensao VALUES (NULL,'351');
INSERT INTO Extensao VALUES (NULL,'386');
INSERT INTO Extensao VALUES (NULL,'34');
INSERT INTO Extensao VALUES (NULL,'55');

INSERT INTO Formato VALUES (NULL,'individual');
INSERT INTO Formato VALUES (NULL,'equipa');
INSERT INTO Formato VALUES (NULL,'um contra todos');
INSERT INTO Formato VALUES (NULL,'sozinho');

INSERT INTO Jogador VALUES (NULL,'Ricardo','1290','2/11/1960','nº 10 andar 9','Rua dos Fósforos', '916010187', 1, 1, 1, 'ricardo@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Manuel','2200','1/3/1973','40','Rua Quinta de Campainha', '916010223', 3, 2, 2, 'manuel10@gmail.com');
INSERT INTO Jogador VALUES (NULL,'João','3310','2/5/1992','1','Rua do Matagalo', '916010139', 1, 3, 3, 'joao99@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Maria','4360','3/5/1973','3','Travessa do Freixo', '81585987', 4, 6, 2, 'maria1023@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Joana','5350','9/6/1996','100','Rua do Bolo do Caco', '015010207', 5, 9, 1, 'joanaxorg@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Alberto','6350','9/12/1987','198','Rua da Bananeira', '212010223', 7, 5, 1, 'albertooguerreiro@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Gonçalo','8390','7/8/1984','1827','Rua da Poncha', '102010229', 2, 4, 1, 'goncalo@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Cristiano','9700','6/7/1988','123','Beco da Velha', '616010216', 6, 6, 1, 'cristian7@gmail.com');
INSERT INTO Jogador VALUES (NULL,'André','10750','23/7/1983','98','Rua dos Sapateiros', '116010119', 8, 7, 6, 'andreandreandrade@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Marta','11019','9/7/1979','231','Rua Maria dos Sapos', '426005823', 9, 8, 8, 'martinha@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Vitória','12992','6/12/1984','98','Beco das Granadas', '525121123', 6, 1, 1, 'vitoriaaa@gmail.com');
INSERT INTO Jogador VALUES (NULL,'Victor','12992','9/9/1990','98','Beco das Granadas', '525121122', 6, 1, 1, 'vitor@gmail.com');

INSERT INTO JogadorEquipa VALUES (12, 7);
INSERT INTO JogadorEquipa VALUES (11, 7);
INSERT INTO JogadorEquipa VALUES (10, 6);
INSERT INTO JogadorEquipa VALUES (9, 6);
INSERT INTO JogadorEquipa VALUES (8, 5);
INSERT INTO JogadorEquipa VALUES (7, 5);
INSERT INTO JogadorEquipa VALUES (5, 5);
INSERT INTO JogadorEquipa VALUES (4, 4);
INSERT INTO JogadorEquipa VALUES (3, 4);
INSERT INTO JogadorEquipa VALUES (2, 4);
INSERT INTO JogadorEquipa VALUES (4, 3);
INSERT INTO JogadorEquipa VALUES (5, 3);
INSERT INTO JogadorEquipa VALUES (3, 2);
INSERT INTO JogadorEquipa VALUES (2, 1);
INSERT INTO JogadorEquipa VALUES (1, 1);

INSERT INTO Arbitro VALUES (NULL,'Marco','13300','20/7/1961','102','Rua do Papel', '916010182', 1, 1, 1, '');
INSERT INTO Arbitro VALUES (NULL,'Nobre','4450','13/6/1977','numero 102 andar 2123','Rua Quinta de Campainha', '916010223', 1, 2, 3, '');
INSERT INTO Arbitro VALUES (NULL,'Asdrubal','1-2300','12/6/1949','4','Rua Quinta de Campainha', '916010223', 5, 1, 1, '');
INSERT INTO Arbitro VALUES (NULL,'Pedro','03-1334','25/8/1976','5','Rua do Pão Duro', '916010223', 7, 7, 6, '');
INSERT INTO Arbitro VALUES (NULL,'Fernando','3134-121','7/11/1981','6','Rua das Delícias', '916010223', 4, 4, 4, '');
INSERT INTO Arbitro VALUES (NULL,'Duarte','3032','11/8/1966','8','Rua Maria Lurdes', '916010223', 2, 2, 2, '');
INSERT INTO Arbitro VALUES (NULL,'Nelson','0313','11/8/1961','4','Rua da Alegria', '916010223', 8, 5, 6, '');

INSERT INTO LocalEncontro VALUES (1, 1, 1, '569', 'Rua Herculano', '211446664');
INSERT INTO LocalEncontro VALUES (2, 2, 2, '710', 'Rua Alberto', '244660077');
INSERT INTO LocalEncontro VALUES (3, 3, 3, '291', 'Rua da Campainha', '124446677');
INSERT INTO LocalEncontro VALUES (4, 4, 3, '520', 'Rua Afonsina', '223446777');
INSERT INTO LocalEncontro VALUES (5, 5, 4, '1200', 'Rua da Travessa', '125446677');

INSERT INTO Torneio VALUES (NULL, 'Torneio Xadrez', '2013/2014', 1, 1);
INSERT INTO Torneio VALUES (NULL, 'Torneio Damas', '2013/2014', 2, 2);
INSERT INTO Torneio VALUES (NULL, 'Torneio Mikado', '2013/2014', 2, 3);
INSERT INTO Torneio VALUES (NULL, 'Torneio The4Mazes', '2013/2014', 2, 4);
INSERT INTO Torneio VALUES (NULL, 'Torneio Sueca', '2013/2014', 3, 5);
INSERT INTO Torneio VALUES (NULL, 'Torneio Epaminondas', '2013/2014', 3, 6);
INSERT INTO Torneio VALUES (NULL, 'Torneio Quatro em Linha', '2013/2014', 3, 7);

INSERT INTO Partida VALUES (NULL, 1, 1, 1, '10/2/2013', 10);
INSERT INTO Partida VALUES (NULL, 1, 1, 1, '11/2/2013', 15);
INSERT INTO Partida VALUES (NULL, 1, 1, 1, '12/2/2013', 20);
INSERT INTO Partida VALUES (NULL, 3, 2, 2, '12/2/2013', 45);
INSERT INTO Partida VALUES (NULL, 2, 5, 2, '12/2/2013', 5);

-- Xadrez
INSERT INTO EquipaPartida VALUES (7,1,1,1998);
INSERT INTO EquipaPartida VALUES (6,1,2,1900);
INSERT INTO EquipaPartida VALUES (6,2,2,2150);
INSERT INTO EquipaPartida VALUES (3,2,1,2191);
INSERT INTO EquipaPartida VALUES (7,3,1,2152);
INSERT INTO EquipaPartida VALUES (3,3,2,2121);
-- Mikado
INSERT INTO EquipaPartida VALUES (5,4,1,1895);
INSERT INTO EquipaPartida VALUES (4,4,2,1864);
-- Sueca
INSERT INTO EquipaPartida VALUES (2,5,2,1795);
INSERT INTO EquipaPartida VALUES (1,5,1,1964);

INSERT INTO EquipaPatrocinadorTorneio VALUES (7,1,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (7,2,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (7,3,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (7,4,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (7,5,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (7,6,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (7,7,1);

INSERT INTO EquipaPatrocinadorTorneio VALUES (3,1,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (3,5,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (3,3,1);

INSERT INTO EquipaPatrocinadorTorneio VALUES (6,2,1);
INSERT INTO EquipaPatrocinadorTorneio VALUES (6,3,1);

INSERT INTO EquipaPatrocinadorTorneio VALUES (5,1,2);
INSERT INTO EquipaPatrocinadorTorneio VALUES (5,5,2);
INSERT INTO EquipaPatrocinadorTorneio VALUES (5,4,2);

INSERT INTO EquipaPatrocinadorTorneio VALUES (4,1,2);
INSERT INTO EquipaPatrocinadorTorneio VALUES (4,2,2);

INSERT INTO EquipaPatrocinadorTorneio VALUES (1,6,5);
INSERT INTO EquipaPatrocinadorTorneio VALUES (1,7,5);

INSERT INTO EquipaPatrocinadorTorneio VALUES (2,1,5);

INSERT INTO ArbitroTipoJogo VALUES (1,1);
INSERT INTO ArbitroTipoJogo VALUES (2,2);
INSERT INTO ArbitroTipoJogo VALUES (3,3);
INSERT INTO ArbitroTipoJogo VALUES (4,4);
INSERT INTO ArbitroTipoJogo VALUES (5,5);
INSERT INTO ArbitroTipoJogo VALUES (6,6);
INSERT INTO ArbitroTipoJogo VALUES (7,7);

INSERT INTO ArbitroPartida VALUES (1, 1);
INSERT INTO ArbitroPartida VALUES (1, 2);
INSERT INTO ArbitroPartida VALUES (1, 3);
INSERT INTO ArbitroPartida VALUES (2, 4);
INSERT INTO ArbitroPartida VALUES (5, 5);
