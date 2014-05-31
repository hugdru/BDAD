PRAGMA foreign_keys = ON;

DROP TRIGGER IF EXISTS ArbitroPodeArbitrarPartida;

-- 1º Trigger - Um arbitro só pode arbitrar uma partida se tiver competências para tal
CREATE TRIGGER ArbitroPodeArbitrarPartida
BEFORE INSERT ON ArbitroPartida
BEGIN
  SELECT CASE
    WHEN
      (
        ( SELECT *
        FROM ArbitroTipoJogo, Partida, Torneio
        WHERE
          ArbitroTipoJogo.idArbitro = new.idArbitro AND
          Partida.idPartida = new.idPartida AND
          Partida.idTorneio = Torneio.idTorneio AND
          ArbitroTipoJogo.idTipoJogo = Torneio.idTipoJogo
        ) IS NULL
      )
    THEN RAISE(ABORT, 'Este arbitro não pode arbitrar este tipo de Jogo')
    END;
END;
CREATE TRIGGER ArbitroPodeArbitrarPartida
BEFORE UPDATE ON ArbitroPartida
BEGIN
  SELECT CASE
    WHEN
      (
        ( SELECT *
        FROM ArbitroTipoJogo, Partida, Torneio
        WHERE
          ArbitroTipoJogo.idArbitro = new.idArbitro AND
          Partida.idPartida = new.idPartida AND
          Partida.idTorneio = Torneio.idTorneio AND
          ArbitroTipoJogo.idTipoJogo = Torneio.idTipoJogo
        ) IS NULL
      )
    THEN RAISE(ABORT, 'Este arbitro não pode arbitrar este tipo de Jogo')
    END;
END;


