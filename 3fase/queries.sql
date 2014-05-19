PRAGMA foreign_keys = ON;

-- Pesquisas para Jogador
-- nome, dataNascimento -- rua, codigo-postal, (idCidade->Cidade)->{nome,pais}, numero/andar, telefone
-- id -- nome, email, (idEquipa->Equipa)->{abreviatura,nome}
-- idPais -- nome, (idEquipa->Equipa)->{abreviatura,nome}
-- idPais -- nome, email
-- idJogador -- idEquipa->Equipa, (idEquipa->Equipa)->Partidas->{dataInicio,duracao}, (idEquipa->Equipa,idPartida)->{posicao,resultado}
--



-- nome, dataNascimento ->
-- pesquisar por uma Equipa: abreviatura
-- pesquisar por uma Cidade: nome
--
