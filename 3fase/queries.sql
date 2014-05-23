PRAGMA foreign_keys = ON;

-- jmoreira@fe.up.pt
-- - Esperam-se pelo menos 8 queries;

-- - As queries serão avaliadas pela sua pertinência para o Sistema de
-- Informação assim como pela diversidade/riqueza do SQL.

-- Encontrar todos os jogadores pertencentes às equipas, e mostrar o idEquipa; nome, email e nacionalidade do jogador.
SELECT (SELECT Equipa.nome FROM Equipa WHERE JogadorEquipa.idEquipa = Equipa.idEquipa) AS nomeEquipa, Jogador.nome AS nomeJogador, Jogador.email AS emailJogador, Pais.nome AS paisJogador
FROM Jogador, JogadorEquipa, Pais
WHERE
  Jogador.idPais = Pais.idPais AND
  Jogador.idJogador = JogadorEquipa.idJogador
ORDER BY JogadorEquipa.idEquipa ASC;

-- Encontrar todos os jogadores de um dada equipa
SELECT JogadorEquipa.idEquipa, Equipa.nome, Equipa.abreviatura, Jogador.nome, Jogador.email, Pais.nome AS Pais
FROM Jogador, JogadorEquipa, Pais, Equipa
WHERE
  Jogador.idPais = Pais.idPais AND
  Jogador.idJogador = JogadorEquipa.idJogador AND
  Equipa.idEquipa = (SELECT Equipa.idEquipa FROM Equipa WHERE Equipa.nome LIKE 'dare%' AND Equipa.abreviatura LIKE 'd%') AND
  JogadorEquipa.idEquipa = Equipa.idEquipa;

-- Encontrar o nome, o email e a nacionalidade de todos os jogadores que participaram num dado torneio
SELECT JogadorEquipa.idEquipa, (SELECT Equipa.nome FROM Equipa WHERE JogadorEquipa.idEquipa = Equipa.idEquipa) AS NomeEquipa, Jogador.nome, Jogador.email, Pais.nome AS Pais
FROM Jogador, JogadorEquipa, Pais
WHERE
  Jogador.idPais = Pais.idPais AND
  Jogador.idJogador = JogadorEquipa.idJogador AND
  JogadorEquipa.idEquipa IN (
    SELECT EquipaPartida.idEquipa FROM EquipaPartida
    WHERE
      EquipaPartida.idPartida IN (
        SELECT Partida.idPartida FROM Partida
        WHERE Partida.idTorneio IN ( SELECT Torneio.idTorneio FROM Torneio WHERE Torneio.nome LIKE 'torneio xadrez' )))
ORDER BY JogadorEquipa.idEquipa ASC;

-- Encontrar o nome, o email e a nacionalidade de todos os jogadores que participaram num dado torneio num dado escalão
SELECT JogadorEquipa.idEquipa, (SELECT Equipa.nome FROM Equipa WHERE JogadorEquipa.idEquipa = Equipa.idEquipa) AS NomeEquipa, Jogador.nome, Jogador.email, Pais.nome AS Pais
FROM Jogador, JogadorEquipa, Pais
WHERE
  Jogador.idPais = Pais.idPais AND
  Jogador.idJogador = JogadorEquipa.idJogador AND
  JogadorEquipa.idEquipa IN (
    SELECT EquipaPartida.idEquipa FROM EquipaPartida
    WHERE
      EquipaPartida.idPartida IN (
        SELECT Partida.idPartida FROM Partida
        WHERE
          Partida.idTorneio IN ( SELECT Torneio.idTorneio FROM Torneio WHERE Torneio.nome LIKE 'torneio xadrez' ) AND
          Partida.idEscalao = ( SELECT idEscalao FROM Escalao WHERE Escalao.nome LIKE 'minis')))
ORDER BY JogadorEquipa.idEquipa ASC;

-- Encontrar o nome, o email e a nacionalidade de todos os jogadores que jogam um tipo de jogo num dado escalao.
SELECT (SELECT Equipa.nome FROM Equipa WHERE JogadorEquipa.idEquipa = Equipa.idEquipa) AS NomeEquipa, Jogador.nome, Jogador.email, Pais.nome AS Pais
FROM Jogador, JogadorEquipa, Pais
WHERE
  Jogador.idPais = Pais.idPais AND
  Jogador.idJogador = JogadorEquipa.idJogador AND
  JogadorEquipa.idEquipa IN (
    SELECT EquipaPartida.idEquipa FROM EquipaPartida
    WHERE
      EquipaPartida.idPartida IN (
        SELECT Partida.idPartida FROM Partida
        WHERE
          Partida.idTorneio IN (
            SELECT Torneio.idTorneio FROM Torneio
            WHERE Torneio.idTipoJogo = (SELECT TipoJogo.idTipoJogo FROM TipoJogo WHERE TipoJogo.nome LIKE 'xadrez')) AND
          Partida.idEscalao = (SELECT idEscalao FROM Escalao WHERE Escalao.nome LIKE 'minis')))
ORDER BY JogadorEquipa.idEquipa ASC;

-- Contar o numero de equipas em que os jogadores estao inscritos
SELECT Jogador.idJogador, Jogador.nome, COUNT(*) AS numeroInscricoesEquipas
FROM Jogador, JogadorEquipa
WHERE Jogador.idJogador = JogadorEquipa.idJogador
GROUP BY Jogador.idJogador;

-- Encontrar o jogador com mais pontos
SELECT idJogador, nome, Pais, MAX(Pontos) FROM (
  SELECT Jogador.idJogador, Jogador.nome, (SELECT Pais.nome FROM Pais WHERE Pais.idPais = Jogador.idPais) AS Pais, SUM(EquipaPartida.resultado) AS Pontos
  FROM Jogador, JogadorEquipa, EquipaPartida
  WHERE
    Jogador.idJogador = JogadorEquipa.idJogador AND
    JogadorEquipa.idEquipa IN ( SELECT EquipaPartida.idEquipa FROM EquipaPartida )
  GROUP BY Jogador.idJogador );

-- Encontrar o jogador com mais pontos de uma Equipa, para todos os jogos/partidas que ele efetuou

-- Encontrar a media e o desvio padrão dos pontos dos jogadores de uma equipa.

-- Encontrar a equipa com mais pontos

-- Encontrar a equipa com mais pontos para um tipo de jogo

-- Encontrar a equipa com mais pontos para um dado jogo e escalão

-- Encontrar a equipa com mais pontos para um dado torneio num dado escalão

-- Encontrar o vencedor do torneio para cada escalão

-- Ver qual é o país mais comum

-- Ver a duração média dos jogos de um dado escalão para um dado jogo

-- Encontrar a duração total para um dado jogo para um dado escalao

