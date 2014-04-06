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
