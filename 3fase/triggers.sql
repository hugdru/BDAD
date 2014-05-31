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


-- 2º Trigger - Um arbitro não poder ser jogador numa partida ( A ideia era dizer que a mesma pessoa nao poder ser arbitro e jogador na mesma partida
-- podiamos ate espandir a ideia para o torneio.
-- uma forma de ver se e a mesma pessoa foi comprar o nome E o telefone , duas pessoas diferentes nao vao ter dois dados iguais

CREATE TRIGGER PessoaArbitroOuJogadorNoTorneio
BEFORE INSERT ON ArbitroPartida
BEGIN
  SELECT CASE
    WHEN
      (
        ( SELECT *
          FROM Arbitro, Partida, EquipaPartida, JogadorEquipa
          WHERE
			Arbitro.idArbitro = new.idArbitro AND
			Partida.idPartida = new.idPartida AND
			Partida.idEquipa = EquipaPartida.idEquipa AND
			JogadorEquipa.idEquipa =  EquipaPartida.idEquipa AND
			!(JogadorEquipa.idJogador.nome == Arbitro.idArbitro.nome AND 
			JogadorEquipa.idJogador.telefone == Arbitro.idArbitro.telefone)
		) IS NULL
	)
	THEN RAISE ( ABORT , 'Ests arbitro nao pode arbitrar esta partida porque e jogador')
	END;
END;

---???

CREATE TRIGGER PessoaArbitroOuJogadorNoTorneio
BEFORE UPDATE ON ArbitroPartida
BEGIN
  SELECT CASE
    WHEN
      (
        ( SELECT *
          FROM Arbitro, Partida, EquipaPartida, JogadorEquipa
          WHERE
			Arbitro.idArbitro = new.idArbitro AND
			Partida.idPartida = new.idPartida AND
			Partida.idEquipa = EquipaPartida.idEquipa AND
			JogadorEquipa.idEquipa =  EquipaPartida.idEquipa AND
			!(JogadorEquipa.idJogador.nome == Arbitro.idArbitro.nome AND 
			JogadorEquipa.idJogador.telefone == Arbitro.idArbitro.telefone)
		) IS NULL
	)
	THEN RAISE ( ABORT , 'Ests arbitro nao pode arbitrar esta partida porque e jogador')
	END;
END;

