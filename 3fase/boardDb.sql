PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Pais;
DROP TABLE IF EXISTS Cidade;
DROP TABLE IF EXISTS Extensao;
DROP TABLE IF EXISTS Arbitro;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS JogadorEquipa;
DROP TABLE IF EXISTS TipoJogo;
DROP TABLE IF EXISTS ArbitroTipoJogo;
DROP TABLE IF EXISTS LocalEncontro;
DROP TABLE IF EXISTS Escalao;
DROP TABLE IF EXISTS Partida;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS EquipaPartida;
DROP TABLE IF EXISTS ArbitroPartida;
DROP TABLE IF EXISTS Patrocinador;
DROP TABLE IF EXISTS EquipaPatrocinadorTorneio;
DROP TABLE IF EXISTS Torneio;
DROP TABLE IF EXISTS Formato;

CREATE TABLE Pais (
  idPais INTEGER,
  nome varchar2(50),
  PRIMARY KEY(idPais));

CREATE TABLE Cidade (
  idCidade INTEGER,
  nome varchar2(50) NOT NULL,
  idPais INTEGER NOT NULL,
  FOREIGN KEY(idPais)
    REFERENCES Pais(idPais)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idCidade));

CREATE TABLE Extensao (
  idExtensao INTEGER,
  codigo char(4),
  PRIMARY KEY(idExtensao));

CREATE TABLE Arbitro (
  idArbitro INTEGER,
  nome varchar2(70) NOT NULL,
  codigoPostal varchar2(10) NOT NULL,
  dataNascimento date NOT NULL,
  numeroAndar varchar2(20) NOT NULL,
  rua varchar2(60) NOT NULL,
  telefone char(9) NOT NULL,
  idPais INTEGER NOT NULL,
  idCidade INTEGER NOT NULL,
  idExtensao INTEGER NOT NULL,
  observacoes varchar2(100),
  FOREIGN KEY(idPais)
    REFERENCES Pais(idPais)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idCidade)
    REFERENCES Cidade(idCidade)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idExtensao)
    REFERENCES Extensao(idExtensao)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idArbitro));

CREATE TABLE Jogador (
  idJogador INTEGER,
  nome varchar2(70) NOT NULL,
  codigoPostal varchar2(10),
  dataNascimento date NOT NULL,
  numeroAndar varchar2(35),
  rua varchar2(60),
  telefone char(9) NOT NULL,
  idPais INTEGER NOT NULL,
  idCidade INTEGER NOT NULL,
  idExtensao INTEGER NOT NULL,
  email varchar2(254) NOT NULL,
  FOREIGN KEY(idPais)
    REFERENCES Pais(idPais)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idCidade)
    REFERENCES Cidade(idCidade)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idExtensao)
    REFERENCES Extensao(idExtensao)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idJogador));

CREATE TABLE Equipa (
  idEquipa INTEGER,
  nome varchar2(60) NOT NULL,
  abreviatura varchar2(10),
  PRIMARY KEY(idEquipa));

CREATE TABLE JogadorEquipa (
  idJogador INTEGER,
  idEquipa INTEGER,
  FOREIGN KEY(idEquipa)
    REFERENCES Equipa(idEquipa)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idJogador)
    REFERENCES Jogador(idJogador)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idEquipa,idJogador));

CREATE TABLE TipoJogo (
  idTipoJogo INTEGER,
  nome varchar2(30) NOT NULL,
  PRIMARY KEY(idTipoJogo));

CREATE TABLE ArbitroTipoJogo (
  idArbitro INTEGER,
  idTipoJogo INTEGER,
  FOREIGN KEY(idArbitro)
    REFERENCES Arbitro(idArbitro)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTipoJogo)
    REFERENCES TipoJogo(idTipoJogo)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idArbitro,idTipoJogo));

CREATE TABLE LocalEncontro (
  idLocalEncontro INTEGER,
  idCidade INTEGER NOT NULL,
  idExtensao INTEGER NOT NULL,
  codigoPostal varchar2(10) NOT NULL,
  rua varchar2(60) NOT NULL,
  telefone char(9) NOT NULL,
  FOREIGN KEY(idCidade)
    REFERENCES Cidade(idCidade)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idExtensao)
    REFERENCES Extensao(idExtensao)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idLocalEncontro));

CREATE TABLE Escalao (
  idEscalao INTEGER,
  nome varchar2(30) NOT NULL,
  PRIMARY KEY(idEscalao));

CREATE TABLE Partida (
  idPartida INTEGER,
  idLocalEncontro INTEGER NOT NULL,
  idTorneio INTEGER NOT NULL,
  idEscalao INTEGER NOT NULL,
  dataInicio date NOT NULL,
  duracao INTEGER,
  FOREIGN KEY(idLocalEncontro)
    REFERENCES LocalEncontro(idLocalEncontro)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idEscalao)
    REFERENCES Escalao(idEscalao)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTorneio)
    REFERENCES Torneio(idTorneio)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idPartida));

CREATE TABLE EquipaPartida (
  idEquipa INTEGER,
  idPartida INTEGER,
  posicao INTEGER NOT NULL,
  resultado INTEGER,
  CHECK ( posicao > 0 ),
  FOREIGN KEY(idEquipa)
    REFERENCES Equipa(idEquipa)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idPartida)
    REFERENCES Partida(idPartida)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idEquipa,idPartida));

CREATE TABLE ArbitroPartida (
  idArbitro INTEGER,
  idPartida INTEGER,
  FOREIGN KEY(idArbitro)
    REFERENCES Arbitro(idArbitro)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idPartida)
    REFERENCES Partida(idPartida)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idArbitro,idPartida));

CREATE TABLE Patrocinador (
  idPatrocinador INTEGER,
  nome varchar2(50) NOT NULL,
  PRIMARY KEY (idPatrocinador));

CREATE TABLE EquipaPatrocinadorTorneio (
  idEquipa INTEGER,
  idPatrocinador INTEGER,
  idTorneio INTEGER,
  FOREIGN KEY(idEquipa)
    REFERENCES Equipa(idEquipa)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idPatrocinador)
    REFERENCES Patrocinador(idPatrocinador)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTorneio)
    REFERENCES Torneio(idTorneio)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idEquipa,idPatrocinador,idTorneio));

CREATE TABLE Torneio (
  idTorneio INTEGER,
  nome varchar2(30),
  temporada TEXT,
  idFormato INTEGER NOT NULL,
  idTipoJogo INTEGER NOT NULL,
  FOREIGN KEY(idFormato)
    REFERENCES Formato(idFormato)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTipoJogo)
    REFERENCES TipoJogo(idTipoJogo)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idTorneio));

CREATE TABLE Formato (
  idFormato INTEGER,
  nome varchar2(25) NOT NULL,
  PRIMARY KEY(idFormato));
