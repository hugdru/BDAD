CREATE TABLE IF NOT EXISTS Jogador (
  idJogador INTEGER AUTOINCREMENT,
  idPais INTEGER NOT NULL,
  idCidade INTEGER,
  idExtensao INTEGER NOT NULL,
  codigoPostal varchar2(10),
  dataNascimento date NOT NULL,
  numeroAndar varchar2(20),
  rua varchar2(60),
  telefone char(9) NOT NULL,
  email varchar2(254) NOT NULL,
  PRIMARY KEY (idJogador),
  FOREIGN KEY (idPais,idCidade,idExtensao))

CREATE TABLE IF NOT EXISTS Equipa (
  idEquipa INTEGER AUTOINCREMENT,
  nome varchar2(60) NOT NULL,
  abreviatura varchar2(10),
  PRIMARY KEY(idEquipa))

CREATE TABLE IF NOT EXISTS JogadorEquipa (
  idEquipa INTEGER,
  idJogador INTEGER,
  FOREIGN KEY (idEquipa,idJogador))

CREATE TABLE IF NOT EXISTS Arbitro (
  idArbitro INTEGER AUTOINCREMENT,
  idPais INTEGER,
  idCidade INTEGER,
  idExtensao INTEGER,
  observacoes varchar2(100),
  FOREIGN KEY (idArbitro,idPais,idCidade,idExtensao))

CREATE TABLE IF NOT EXISTS LocalEncontro (
  idLocalEncontro INTEGER AUTOINCREMENT,
  idCidade INTEGER, NOT NULL
  idExtensao INTEGER, NOT NULL
  codigoPostal varchar2(10), NOT NULL
  rua varchar2(60), NOT NULL
  telefone char(9), NOT NULL
  PRIMARY KEY (idLocalEncontro),
  FOREIGN KEY (idCidade,idExtensao))

CREATE TABLE IF NOT EXISTS Cidade (
  idCidade INTEGER AUTOINCREMENT,
  nome varchar2(50), NOT NULL
  idPais INTEGER,
  PRIMARY KEY (idCidade),
  FOREIGN KEY (idPais))

CREATE TABLE IF NOT EXISTS TipoJogo (
  idTipoJogo INTEGER AUTOINCREMENT,
  nome varchar2(30), NOT NULL
  PRIMARY KEY idTipoJogo)

CREATE TABLE IF NOT EXISTS ArbitroTipoJogo (
  idArbitro INTEGER,
  idTipoJogo INTEGER,
  FOREIGN KEY (idArbitro,idTipoJogo))

CREATE TABLE IF NOT EXISTS Partida (
  idPartida INTEGER AUTOINCREMENT,
  idEscalao INTEGER,
  dataInicio date NOT NULL
  duracao time,
  PRIMARY KEY (idPartida),
  FOREIGN KEY (idEscalao))

CREATE TABLE IF NOT EXISTS ArbitroPartida (
  idArbitro INTEGER,
  idPartida INTEGER,
  FOREIGN KEY (idArbitro,idPartida))

CREATE TABLE IF NOT EXISTS Escalao (
  idEscalao INTEGER AUTOINCREMENT,
  nome varchar2(30),
  PRIMARY KEY (idEscalao))

CREATE TABLE IF NOT EXISTS EquipaPartida (
  idEquipa INTEGER,
  idPartida INTEGER,
  posicao INTEGER NOT NULL,
  resultado INTEGER NOT NULL,
  FOREIGN KEY (idEquipa,idPartida))

CREATE TABLE IF NOT EXISTS Patrocinador (
  idPatrocinador INTEGER AUTOINCREMENT,
  nome varchar2(50),
  PRIMARY KEY (idPatrocinador))

CREATE TABLE IF NOT EXISTS EquipaPatrocinadorTorneio (
  idEquipa INTEGER,
  idPatrocinador INTEGER,
  idTorneio INTEGER,
  FOREIGN KEY (idEquipa,idPatrocinador,idTorneio))
