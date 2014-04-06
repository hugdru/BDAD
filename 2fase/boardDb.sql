CREATE TABLE IF NOT EXISTS Jogador (
  idJogador INTEGER AUTOINCREMENT,
  nome varchar2(70) NOT NULL,
  codigoPostal varchar2(10),
  dataNascimento date NOT NULL,
  numeroAndar varchar2(20),
  rua varchar2(60),
  telefone char(9) NOT NULL,
  idPais INTEGER NOT NULL,
  idCidade INTEGER,
  idExtensao INTEGER NOT NULL,
  email varchar2(254) NOT NULL,
  FOREIGN KEY(idPais) REFERENCES Pais(idPais),
  FOREIGN KEY(idCidade) REFERENCES Cidade(idCidade),
  FOREIGN KEY(idExtensao) REFERENCES Extensao(idExtensao),
  PRIMARY KEY(idJogador));

CREATE TABLE IF NOT EXISTS Equipa (
  nome varchar2(60),
  abreviatura varchar2(10),
  PRIMARY KEY(nome));

CREATE TABLE IF NOT EXISTS JogadorEquipa (
  idEquipa varchar2(60),
  idJogador INTEGER,
  FOREIGN KEY(idEquipa) REFERENCES Equipa(nome),
  FOREIGN KEY(idJogador) REFERENCES Jogador(idJogador),
  PRIMARY KEY(idEquipa,idJogador));

CREATE TABLE IF NOT EXISTS Arbitro (
  idArbitro INTEGER AUTOINCREMENT,
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
  FOREIGN KEY(idPais) REFERENCES Pais(idPais),
  FOREIGN KEY(idCidade) REFERENCES Cidade(idCidade),
  FOREIGN KEY(idExtensao) REFERENCES Extensao(idExtensao),
  PRIMARY KEY(idArbitro));

CREATE TABLE IF NOT EXISTS LocalEncontro (
  idLocalEncontro INTEGER AUTOINCREMENT,
  idCidade INTEGER NOT NULL,
  idExtensao INTEGER NOT NULL,
  codigoPostal varchar2(10) NOT NULL,
  rua varchar2(60) NOT NULL,
  telefone char(9) NOT NULL,
  FOREIGN KEY(idCidade) REFERENCES Cidade(idCidade),
  FOREIGN KEY(idExtensao) REFERENCES Extensao(idExtensao),
  PRIMARY KEY(idLocalEncontro));

CREATE TABLE IF NOT EXISTS Cidade (
  idCidade INTEGER AUTOINCREMENT,
  nome varchar2(50) NOT NULL,
  idPais INTEGER NOT NULL,
  FOREIGN KEY(idPais) REFERENCES Pais(idPais),
  PRIMARY KEY(idCidade) REFERENCES Cidade(idCidade));

CREATE TABLE IF NOT EXISTS TipoJogo (
  nome varchar2(30),
  PRIMARY KEY(nome));

CREATE TABLE IF NOT EXISTS ArbitroTipoJogo (
  idArbitro INTEGER,
  idTipoJogo varchar2(30),
  FOREIGN KEY(idArbitro) REFERENCES Arbitro(idArbitro),
  FOREIGN KEY(idTipoJogo) REFERENCES TipoJogo(nome),
  PRIMARY KEY(idArbitro,idTipoJogo));

CREATE TABLE IF NOT EXISTS Partida (
  idPartida INTEGER AUTOINCREMENT,
  idEscalao varchar2(30),
  dataInicio date NOT NULL,
  duracao INTEGER,
  FOREIGN KEY(idEscalao) REFERENCES Escalao(nome),
  PRIMARY KEY(idPartida));

CREATE TABLE IF NOT EXISTS ArbitroPartida (
  idArbitro INTEGER,
  idPartida INTEGER,
  FOREIGN KEY(idArbitro) REFERENCES Arbitro(idArbitro),
  FOREIGN KEY(idPartida) REFERENCES Partida(idPartida),
  PRIMARY KEY(idArbitro,idPartida));

CREATE TABLE IF NOT EXISTS Escalao (
  nome varchar2(30),
  PRIMARY KEY(nome));

CREATE TABLE IF NOT EXISTS EquipaPartida (
  idEquipa varchar(60),
  idPartida INTEGER,
  posicao INTEGER NOT NULL,
  resultado INTEGER,
  FOREIGN KEY(idEquipa) Equipa(nome),
  FOREIGN KEY(idPartida) Partida(idPartida),
  PRIMARY KEY(idEquipa,idPartida));

CREATE TABLE IF NOT EXISTS Patrocinador (
  nome varchar2(50),
  PRIMARY KEY (nome));

CREATE TABLE IF NOT EXISTS EquipaPatrocinadorTorneio (
  idEquipa INTEGER,
  idPatrocinador varchar2(50),
  idTorneio INTEGER,
  FOREIGN KEY(idEquipa) REFERENCES Equipa(nome),
  FOREIGN KEY(idPatrocinador) REFERENCES Patrocinador(nome),
  FOREIGN KEY(idTorneio) REFERENCES Torneio(idTorneio),
  PRIMARY KEY(idEquipa,idPatrocinador,idTorneio));

CREATE TABLE IF NOT EXISTS Torneio (
  idTorneio INTEGER AUTOINCREMENT,
  nome varchar2(30),
  temporada year-monthInterval,
  formato varchar2(20),
  idTipoJogo varchar2(30),
  FOREIGN KEY(IdTipoJogo) REFERENCES TipoJogo(nome)
  PRIMARY KEY(idTorneio));
