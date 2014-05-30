PRAGMA foreign_keys = ON;

-- jmoreira@fe.up.pt
-- Esperam-se pelo menos 8 queries;

-- As queries serão avaliadas pela sua pertinência para o Sistema de
-- Informação assim como pela diversidade/riqueza do SQL.

-- Principais
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

-- Encontrar o jogador com mais pontos
SELECT idJogador, nome, Pais, MAX(Pontos) FROM (
  SELECT Jogador.idJogador, Jogador.nome, (SELECT Pais.nome FROM Pais WHERE Pais.idPais = Jogador.idPais) AS Pais, SUM(EquipaPartida.resultado) AS Pontos
  FROM Jogador, JogadorEquipa, EquipaPartida
  WHERE
    Jogador.idJogador = JogadorEquipa.idJogador AND
    JogadorEquipa.idEquipa = EquipaPartida.idEquipa
  GROUP BY Jogador.idJogador);

-- Encontrar a pontuação de todos os jogadores de uma equipa para todas as partidas que eles realizaram
SELECT JogadorEquipa.idJogador AS idJogador, ( SELECT Jogador.nome FROM Jogador WHERE Jogador.idJogador = JogadorEquipa.idJogador ) AS Nome, ( SELECT Pais.nome FROM Pais WHERE Pais.idPais = ( SELECT Jogador.idPais FROM Jogador WHERE Jogador.idJogador = JogadorEquipa.idJogador )) AS Pais, SUM(EquipaPartida.resultado) AS Pontos
FROM JogadorEquipa, EquipaPartida
WHERE
  JogadorEquipa.idJogador IN ( SELECT JogadorEquipa.idJogador FROM JogadorEquipa WHERE JogadorEquipa.idEquipa = ( SELECT Equipa.idEquipa FROM Equipa WHERE Equipa.nome LIKE 'godmode' AND Equipa.abreviatura LIKE 'gdm'))
  AND
  JogadorEquipa.idEquipa = EquipaPartida.idEquipa
GROUP BY JogadorEquipa.idJogador;

-- Encontrar o jogador com mais pontos de uma Equipa
SELECT idJogador, Nome, Pais, MAX(Pontos) pontosMaximosEquipa
FROM (
  SELECT JogadorEquipa.idJogador AS idJogador, ( SELECT Jogador.nome FROM Jogador WHERE Jogador.idJogador = JogadorEquipa.idJogador ) AS Nome, ( SELECT Pais.nome FROM Pais WHERE Pais.idPais = ( SELECT Jogador.idPais FROM Jogador WHERE Jogador.idJogador = JogadorEquipa.idJogador )) AS Pais, SUM(EquipaPartida.resultado) AS Pontos
  FROM JogadorEquipa, EquipaPartida
  WHERE
    JogadorEquipa.idJogador IN ( SELECT JogadorEquipa.idJogador FROM JogadorEquipa WHERE JogadorEquipa.idEquipa = ( SELECT Equipa.idEquipa FROM Equipa WHERE Equipa.nome LIKE 'godmode' AND Equipa.abreviatura LIKE 'gdm'))
    AND
    JogadorEquipa.idEquipa = EquipaPartida.idEquipa
  GROUP BY JogadorEquipa.idJogador);

-- Encontrar a variância da pontuação dos jogadores de uma equipa. Sqlite não tem raiz quadrada muito menos uma função que calcule o desvio padrão ou a variância, era melhor calcular o desvio padrão. Foi necessário usar uma tabela temporária para posterior manipulação dos pontos (contas).
CREATE TEMP TABLE PontosTemp( Pontos INTEGER );

INSERT INTO PontosTemp
SELECT Pontos
FROM (
  SELECT JogadorEquipa.idJogador AS idJogador, ( SELECT Jogador.nome FROM Jogador WHERE Jogador.idJogador = JogadorEquipa.idJogador ) AS Nome, ( SELECT Pais.nome FROM Pais WHERE Pais.idPais = ( SELECT Jogador.idPais FROM Jogador WHERE Jogador.idJogador = JogadorEquipa.idJogador )) AS Pais, SUM(EquipaPartida.resultado) AS Pontos
  FROM JogadorEquipa, EquipaPartida
  WHERE
    JogadorEquipa.idJogador IN ( SELECT JogadorEquipa.idJogador FROM JogadorEquipa WHERE JogadorEquipa.idEquipa = ( SELECT Equipa.idEquipa FROM Equipa WHERE Equipa.nome LIKE 'godmode' AND Equipa.abreviatura LIKE 'gdm'))
    AND
    JogadorEquipa.idEquipa = EquipaPartida.idEquipa
  GROUP BY JogadorEquipa.idJogador);

SELECT * FROM PontosTemp;

SELECT SUMATORIO/(COUNT(Pontos)-1) AS Variancia FROM PontosTemp, (
  SELECT SUM(distancias) AS SUMATORIO FROM (
    SELECT ((Pontos - Media)*(Pontos - Media)) AS distancias FROM PontosTemp, (
      SELECT AVG(Pontos) AS Media FROM PontosTemp )));

DROP TABLE IF EXISTS PontosTemp;

-- Encontrar a equipa com mais pontos para um tipo de jogo e escalão
SELECT idEquipa, nomeEquipa, MAX(Pontos)
FROM (
  SELECT EquipaPartida.idEquipa, ( SELECT Equipa.nome FROM Equipa WHERE Equipa.idEquipa = EquipaPartida.idEquipa ) AS nomeEquipa, SUM(EquipaPartida.Resultado) AS Pontos
  FROM EquipaPartida, Partida
  WHERE
    EquipaPartida.idPartida = Partida.idPartida AND
    Partida.idEscalao = ( SELECT Escalao.idEscalao FROM Escalao WHERE Escalao.nome LIKE 'iniciados' ) AND
    Partida.idTorneio IN ( SELECT Torneio.idTorneio FROM Torneio WHERE Torneio.idTipoJogo = ( SELECT TipoJogo.idTipoJogo FROM TipoJogo WHERE TipoJogo.nome LIKE 'sueca' ) )
  GROUP BY EquipaPartida.idEquipa);

-- Encontrar a equipa com mais pontos
SELECT idEquipa, nomeEquipa, MAX(Pontos)
FROM (
  SELECT EquipaPartida.idEquipa, ( SELECT Equipa.nome FROM Equipa WHERE Equipa.idEquipa = EquipaPartida.idEquipa ) AS nomeEquipa, SUM(EquipaPartida.Resultado) AS Pontos
  FROM EquipaPartida
  GROUP BY EquipaPartida.idEquipa);

-- Encontrar a equipa com mais pontos para um dado torneio num dado escalão
-- Dúvida em torneio podem haver vários torneios com o mesmo nome... Melhor maneira -> Procura-se com um id ? Ou pede-se todos os campos ?
SELECT idEquipa, nomeEquipa, MAX(Pontos)
FROM (
  SELECT EquipaPartida.idEquipa, ( SELECT Equipa.nome FROM Equipa WHERE Equipa.idEquipa = EquipaPartida.idEquipa ) AS nomeEquipa, SUM(EquipaPartida.Resultado) AS Pontos
  FROM EquipaPartida, Partida
  WHERE
    EquipaPartida.idPartida = Partida.idPartida AND
    Partida.idEscalao = ( SELECT Escalao.idEscalao FROM Escalao WHERE Escalao.nome LIKE 'iniciados' ) AND
    Partida.idTorneio = 2
  GROUP BY EquipaPartida.idEquipa );

-- Outros
-- Ver a duração média dos jogos para um dado tipo jogo
SELECT TipoJogo.nome AS TipoJogo, AVG(duracao) AS mediaMinutos
FROM Torneio, Partida, TipoJogo
WHERE
  TipoJogo.nome LIKE 'xadrez' AND
  TipoJogo.idTipoJogo = Torneio.idTipoJogo AND
  Partida.idTorneio = Torneio.idTorneio;

-- Ver qual é o país mais comum
SELECT ( SELECT Pais.nome FROM Pais WHERE Pais.idPais = idPais ) AS Pais, MAX(Total) FROM (
  SELECT idPais, COUNT(*) AS Total FROM (
    SELECT nome, idPais FROM Arbitro
    UNION
    SELECT nome, idPais FROM Jogador
    ORDER BY idPais ASC)
  GROUP BY idPais);

-- Encontrar o nome, o email e a nacionalidade de todos os jogadores que jogam num tipo de jogo num dado escalão.
SELECT Jogador.nome, Jogador.email, Pais.nome AS Pais
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

-- Encontrar o nome, o email e a nacionalidade de todos os jogadores que participaram num dado torneio com um dado nome( podem haver vários).
-- Dúvida torneio.nome não é chave primária por isso pode haver mais que um torneio com esse nome.. Melhor maneira -> Peço as colunas todas? Depende do que eu queira ...
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

-- Contar o número de equipas em que os jogadores estão inscritos
SELECT Jogador.idJogador, Jogador.nome, COUNT(*) AS numeroInscricoesEquipas
FROM Jogador, JogadorEquipa
WHERE Jogador.idJogador = JogadorEquipa.idJogador
GROUP BY Jogador.idJogador;

-- Pontuação total por jogador
SELECT Jogador.idJogador, Jogador.nome, (SELECT Pais.nome FROM Pais WHERE Pais.idPais = Jogador.idPais) AS Pais, SUM(EquipaPartida.resultado) AS Pontos
FROM Jogador, JogadorEquipa, EquipaPartida
WHERE
  Jogador.idJogador = JogadorEquipa.idJogador
  AND
  JogadorEquipa.idEquipa = EquipaPartida.idEquipa
GROUP BY Jogador.idJogador;
