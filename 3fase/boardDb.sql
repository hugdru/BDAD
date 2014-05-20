PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS Pais (
  idPais INTEGER,
  nome varchar2(50),
  PRIMARY KEY(idPais));

CREATE TABLE IF NOT EXISTS Cidade (
  idCidade INTEGER,
  nome varchar2(50) NOT NULL,
  idPais INTEGER NOT NULL,
  FOREIGN KEY(idPais)
    REFERENCES Pais(idPais)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idCidade));

CREATE TABLE IF NOT EXISTS Extensao (
  idExtensao INTEGER,
  codigo char(3),
  PRIMARY KEY(idExtensao));

CREATE TABLE IF NOT EXISTS Arbitro (
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

CREATE TABLE IF NOT EXISTS Jogador (
  idJogador INTEGER,
  nome varchar2(70) NOT NULL,
  codigoPostal varchar2(10),
  dataNascimento date NOT NULL,
  numeroAndar varchar2(35),
  rua varchar2(60),
  telefone char(9) NOT NULL,
  idPais INTEGER NOT NULL,
  idCidade INTEGER,
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

CREATE TABLE IF NOT EXISTS Equipa (
  idEquipa INTEGER,
  nome varchar2(60),
  abreviatura varchar2(10),
  PRIMARY KEY(idEquipa));

CREATE TABLE IF NOT EXISTS JogadorEquipa (
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

CREATE TABLE IF NOT EXISTS TipoJogo (
  idTipoJogo INTEGER,
  nome varchar2(30),
  PRIMARY KEY(idTipoJogo));

CREATE TABLE IF NOT EXISTS ArbitroTipoJogo (
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

CREATE TABLE IF NOT EXISTS LocalEncontro (
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

CREATE TABLE IF NOT EXISTS Escalao (
  idEscalao INTEGER,
  nome varchar2(30),
  PRIMARY KEY(idEscalao));

CREATE TABLE IF NOT EXISTS Partida (
  idPartida INTEGER,
  idLocalEncontro INTEGER,
  idTorneio INTEGER,
  idEscalao INTEGER,
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

CREATE TABLE IF NOT EXISTS EquipaPartida (
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

CREATE TABLE IF NOT EXISTS Patrocinador (
  idPatrocinador INTEGER,
  nome varchar2(50),
  PRIMARY KEY (idPatrocinador));

CREATE TABLE IF NOT EXISTS EquipaPatrocinadorTorneio (
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

CREATE TABLE IF NOT EXISTS Torneio (
  idTorneio INTEGER,
  nome varchar2(30),
  temporada TEXT,
  idFormato INTEGER,
  idTipoJogo INTEGER,
  FOREIGN KEY(idFormato)
    REFERENCES Formato(idFormato)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  FOREIGN KEY(idTipoJogo)
    REFERENCES TipoJogo(idTipoJogo)
      ON DELETE SET NULL
      ON UPDATE CASCADE,
  PRIMARY KEY(idTorneio));

CREATE TABLE IF NOT EXISTS Formato (
  idFormato INTEGER,
  nome varchar2(25),
  PRIMARY KEY(idFormato));
