PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Jogador (
  idJogador INTEGER AUTO_INCREMENT,
  nome varchar2(70) NOT NULL,
  codigoPostal varchar2(10),
  dataNascimento date NOT NULL,
  numeroAndar varchar2(20),
  rua varchar2(60),
  telefone char(9) NOT NULL,
  idPais varchar2(50) NOT NULL,
  idCidade INTEGER,
  idExtensao INTEGER NOT NULL,
  email varchar2(254) NOT NULL,
  FOREIGN KEY(idPais)
    REFERENCES Pais(nome)
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

CREATE TABLE IF NOT EXISTS Equipa (
  nome varchar2(60),
  abreviatura varchar2(10),
  PRIMARY KEY(nome));

CREATE TABLE IF NOT EXISTS JogadorEquipa (
  idEquipa varchar2(60),
  idJogador INTEGER,
  FOREIGN KEY(idEquipa)
    REFERENCES Equipa(nome)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idJogador)
    REFERENCES Jogador(idJogador)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idEquipa,idJogador));

CREATE TABLE IF NOT EXISTS Arbitro (
  idArbitro INTEGER AUTO_INCREMENT,
  nome varchar2(70) NOT NULL,
  codigoPostal varchar2(10) NOT NULL,
  dataNascimento date NOT NULL,
  numeroAndar varchar2(20) NOT NULL,
  rua varchar2(60) NOT NULL,
  telefone char(9) NOT NULL,
  idPais varchar2(50) NOT NULL,
  idCidade INTEGER NOT NULL,
  idExtensao INTEGER NOT NULL,
  observacoes varchar2(100),
  FOREIGN KEY(idPais)
    REFERENCES Pais(nome)
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

CREATE TABLE IF NOT EXISTS LocalEncontro (
  idLocalEncontro INTEGER AUTO_INCREMENT,
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

CREATE TABLE IF NOT EXISTS Extensao (
  idExtensao INTEGER AUTO_INCREMENT,
  codigo char(3),
  PRIMARY KEY(idExtensao));

CREATE TABLE IF NOT EXISTS Pais (
  nome varchar2(50),
  PRIMARY KEY(nome));

CREATE TABLE IF NOT EXISTS Cidade (
  idCidade INTEGER AUTO_INCREMENT,
  nome varchar2(50) NOT NULL,
  idPais varchar2(50) NOT NULL,
  FOREIGN KEY(idPais)
    REFERENCES Pais(nome)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idCidade));

CREATE TABLE IF NOT EXISTS TipoJogo (
  nome varchar2(30),
  PRIMARY KEY(nome));

CREATE TABLE IF NOT EXISTS ArbitroTipoJogo (
  idArbitro INTEGER,
  idTipoJogo varchar2(30),
  FOREIGN KEY(idArbitro)
    REFERENCES Arbitro(idArbitro)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTipoJogo)
    REFERENCES TipoJogo(nome)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idArbitro,idTipoJogo));

CREATE TABLE IF NOT EXISTS Partida (
  idPartida INTEGER AUTO_INCREMENT,
  idLocalEncontro INTEGER,
  idTorneio INTEGER,
  idEscalao varchar2(30),
  dataInicio date NOT NULL,
  duracao INTEGER,
  FOREIGN KEY(idLocalEncontro)
    REFERENCES LocalEncontro(idLocalEncontro)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idEscalao)
    REFERENCES Escalao(nome)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTorneio)
    REFERENCES Torneio(idTorneio)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idPartida));

CREATE TABLE IF NOT EXISTS ArbitroPartida (
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

CREATE TABLE IF NOT EXISTS Escalao (
  nome varchar2(30),
  PRIMARY KEY(nome));

CREATE TABLE IF NOT EXISTS EquipaPartida (
  idEquipa varchar2(60),
  idPartida INTEGER,
  posicao INTEGER NOT NULL,
  resultado INTEGER,
  CHECK ( posicao > 0 ),
  FOREIGN KEY(idEquipa)
    REFERENCES Equipa(nome)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idPartida)
    REFERENCES Partida(idPartida)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idEquipa,idPartida));

CREATE TABLE IF NOT EXISTS Patrocinador (
  nome varchar2(50),
  PRIMARY KEY (nome));

CREATE TABLE IF NOT EXISTS EquipaPatrocinadorTorneio (
  idEquipa varchar2(60),
  idPatrocinador varchar2(50),
  idTorneio INTEGER,
  FOREIGN KEY(idEquipa)
    REFERENCES Equipa(nome)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idPatrocinador)
    REFERENCES Patrocinador(nome)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTorneio)
    REFERENCES Torneio(idTorneio)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idEquipa,idPatrocinador,idTorneio));

CREATE TABLE IF NOT EXISTS Torneio (
  idTorneio INTEGER AUTO_INCREMENT,
  nome varchar2(30),
  temporada TEXT,
  formato varchar2(20),
  idTipoJogo varchar2(30),
  FOREIGN KEY(IdTipoJogo)
    REFERENCES TipoJogo(nome)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idTorneio));
