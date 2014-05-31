-- PRAGMA foreign_keys = ON;

DROP TRIGGER IF EXISTS ArbitroPodeArbitrarPartidaInsert;
DROP TRIGGER IF EXISTS ArbitroPodeArbitrarPartidaUpdate;
DROP TRIGGER IF EXISTS JogadorUmaEquipaUmTorneioInsert;
-- DROP TRIGGER IF EXISTS JogadorUmaEquipaUmTorneioUpdate;

-- 1º Trigger - Um arbitro só pode arbitrar uma partida se tiver competências para tal (Insert e Update)
CREATE TRIGGER ArbitroPodeArbitrarPartidaInsert
BEFORE INSERT ON ArbitroPartida
WHEN NOT EXISTS
  ( SELECT Torneio.idTipoJogo
    FROM ArbitroTipoJogo, Partida, Torneio
    WHERE
      ArbitroTipoJogo.idArbitro = new.idArbitro AND
      Partida.idPartida = new.idPartida AND
      Partida.idTorneio = Torneio.idTorneio AND
      ArbitroTipoJogo.idTipoJogo = Torneio.idTipoJogo
  )
BEGIN
    SELECT RAISE(ABORT, 'Este arbitro não pode arbitrar este tipo de Jogo!');
END;
CREATE TRIGGER ArbitroPodeArbitrarPartidaUpdate
BEFORE UPDATE ON ArbitroPartida
WHEN NOT EXISTS
  ( SELECT Torneio.idTipoJogo
    FROM ArbitroTipoJogo, Partida, Torneio
    WHERE
      ArbitroTipoJogo.idArbitro = new.idArbitro AND
      Partida.idPartida = new.idPartida AND
      Partida.idTorneio = Torneio.idTorneio AND
      ArbitroTipoJogo.idTipoJogo = Torneio.idTipoJogo
  )
BEGIN
    SELECT RAISE(ABORT, 'Este arbitro não pode arbitrar este tipo de Jogo!');
END;

-- 2º Trigger - Um jogador so pode estar numa equipa num torneio (Insert e Update)
CREATE TRIGGER JogadorUmaEquipaUmTorneioInsert
BEFORE INSERT ON EquipaPartida
WHEN EXISTS
  (
    SELECT JogadorEquipa.idJogador
    FROM JogadorEquipa, EquipaPartida
    WHERE
      JogadorEquipa.idEquipa NOT IN ( new.idEquipa ) AND
      JogadorEquipa.idEquipa = EquipaPartida.idEquipa AND
      EquipaPartida.idPartida IN (
          SELECT Partida.idPartida
          FROM Partida
          WHERE Partida.idTorneio = ( SELECT Partida.idTorneio FROM Partida WHERE Partida.idPartida = new.idPartida)
      )
    INTERSECT
    SELECT JogadorEquipa.idJogador
    FROM JogadorEquipa
    WHERE JogadorEquipa.idEquipa = new.idEquipa
  )
BEGIN
  SELECT RAISE(ABORT, 'Esta equipa tem um jogador comum noutra, o que não pode acontecer num mesmo torneio!');
END;
CREATE TRIGGER JogadorUmaEquipaUmTorneioUpdate
BEFORE UPDATE ON EquipaPartida
WHEN EXISTS
  (
    SELECT JogadorEquipa.idJogador
    FROM JogadorEquipa, EquipaPartida
    WHERE
      JogadorEquipa.idEquipa NOT IN ( new.idEquipa ) AND
      JogadorEquipa.idEquipa = EquipaPartida.idEquipa AND
      EquipaPartida.idPartida IN (
          SELECT Partida.idPartida
          FROM Partida
          WHERE Partida.idTorneio = ( SELECT Partida.idTorneio FROM Partida WHERE Partida.idPartida = new.idPartida)
      )
    INTERSECT
    SELECT JogadorEquipa.idJogador
    FROM JogadorEquipa
    WHERE JogadorEquipa.idEquipa = new.idEquipa
  )
BEGIN
  SELECT RAISE(ABORT, 'Esta equipa tem um jogador comum noutra, o que não pode acontecer num mesmo torneio!');
END;

-- 3º Trigger -
