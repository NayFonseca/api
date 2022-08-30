

INSERT INTO convidados.convidados(
	nome, area, programa, email, data_criacao, data_atualizacao)
	VALUES ('fulano', 'ensino', 'mgtv', 'teste@teste.com.br', '2022-08-06 22:55:00', '2022-08-06 22:55:00');


INSERT INTO convidados.convidados(
	nome, area, programa, email, data_criacao, data_atualizacao)
	VALUES ('fulano', 'ensino', 'mgtv', 'teste@teste.com.br', '2022-08-06 22:55:00', '2022-08-06 22:55:00') RETURNING *;


INSERT INTO convidados.usuarios(
	login, senha)
	VALUES ('siclano','123456789');


INSERT INTO convidados.criticas(
	"FK_usuario", "FK_convidado", nota, comentario, data_criacao, data_atualizacao)
	VALUES (1, 1, 3, 'sabe mais ou menos sobre a área dele','2022-08-06 22:55:00' , '2022-08-06 22:55:00');


ALTER SEQUENCE convidados.convidados_id_seq RESTART WITH 1;
ALTER SEQUENCE convidados.usuarios_id_seq RESTART WITH 1;
ALTER SEQUENCE convidados.criticas_id_seq RESTART WITH 1;


select * from convidados.convidados;
select * from convidados.usuarios;
select * from convidados.criticas;