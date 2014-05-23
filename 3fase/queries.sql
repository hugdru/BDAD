PRAGMA foreign_keys = ON;

-- jmoreira@fe.up.pt
-- - Esperam-se pelo menos 8 queries;

-- - As queries serão avaliadas pela sua pertinência para o Sistema de
-- Informação assim como pela diversidade/riqueza do SQL.

-- Encontrar o nome, o email dos jogadores e a Nacionalidade agrupando por equipas, que participaram num dado torneio
SELECT Jogador.nome, Jogador.email, Pais.nome
FROM Jogador, JogadorEquipa, Pais
WHERE
  Jogador.idPais = Pais.idPais AND
  Jogador.idJogador = JogadorEquipa.idJogador AND
  JogadorEquipa.idEquipa = (
    SELECT EquipaPartida.idEquipa FROM EquipaPartida
    WHERE
      EquipaPartida.idPartida =
        (SELECT Partida.idPartida FROM Partida
          WHERE Partida.idTorneio = (SELECT Torneio.idTorneio FROM Torneio WHERE Torneio.nome LIKE 'torneio xadrez')));
ORDER BY JogadorEquipa.idEquipa ASC;

-- Encontrar o nome, o email e a Nacionalidade dos Jogadores de todas as uma equipa
SELECT Jogador.nome, Jogador.email, Pais.nome
FROM Jogador, JogadorEquipa, Pais
WHERE
  Jogador.idJogador = JogadorEquipa.idJogador;
  Jogador.idPais = Pais.idPais;
  JogadorEquipa.idEquipa = (SELECT Equipa.idEquipa FROM Equipa WHERE Equipa.nome LIKE 'dare%')
ORDER BY JogadorEquipa.idEquipa ASC;

-- Encontrar o nome, o email e a Nacionalidade dos Jogadores pertencentes a uma equipa, de um dado escalao, de um dado tipo de jogo
SELECT Jogador.nome, Jogador.email, Pais.nome
FROM Jogador, JogadorEquipa, Pais
WHERE
  Jogador.idPais = Pais.idPais AND
  Jogador.idJogador = JogadorEquipa.idJogador AND
  JogadorEquipa.idEquipa = (
    SELECT EquipaPartida.idEquipa FROM EquipaPartida
    WHERE
      EquipaPartida.idPartida = (
        SELECT Partida.idPartida FROM Partida
        WHERE
          Partida.idTorneio = (
            SELECT Torneio.idTorneio FROM Torneio
            WHERE Torneio.idTipoJogo = (SELECT TipoJogo.idTipoJogo FROM TipoJogo WHERE TipoJogo.nome LIKE 'xadrez'))
          Patida.idEscalao = LIKE 'minis'))
ORDER BY JogadorEquipa.idEquipa ASC;

-- Contar o numero de equipas em que os jogadores estao inscritos
SELECT Jogador.id, Jogador.nome, COUNT(*)
FROM Jogador, JogadorEquipa
WHERE Jogador.idJogador = JogadorEquipa.idJogador;


-- Encontrar o vencedor do torneio para cada escalão

-- Encontrar o jogador com mais pontos de uma Equipa, para todos os jogos que ele efetuou

-- Encontrar o jogador com mais pontos

-- Encontrar a equipa com mais pontos

-- Encontrar a equipa com mais pontos para um dado jogo e escalão

-- Encontrar a equipa com mais pontos num dado ano

-- Ver qual é o país mais comum

-- Ver a duração media dos jogos de um dado escalão para um dado jogo

-- Encontrar a duração total

-- Encontrar a media e o desvio padrão dos pontos dos jogadores de uma equipa.

