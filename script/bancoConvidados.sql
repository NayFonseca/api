

CREATE SCHEMA IF NOT EXISTS convidados
    AUTHORIZATION postgres;


CREATE SEQUENCE convidados.convidados_id_seq;

CREATE TABLE IF NOT EXISTS convidados.convidados
(
    id integer NOT NULL DEFAULT nextval('convidados.convidados_id_seq'::regclass),
    nome character varying(255) COLLATE pg_catalog."default" NOT NULL,
    area character varying(255) COLLATE pg_catalog."default" NOT NULL,
    programa character varying(255) COLLATE pg_catalog."default",
    email character varying(255) COLLATE pg_catalog."default",
    data_criacao timestamp without time zone,
    data_atualizacao timestamp without time zone,
    CONSTRAINT convidados_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS convidados.convidados
    OWNER to postgres;



CREATE SEQUENCE convidados.usuarios_id_seq;

CREATE TABLE IF NOT EXISTS convidados.usuarios
(
    id integer NOT NULL DEFAULT nextval('convidados.usuarios_id_seq'::regclass),
    login character varying(255) COLLATE pg_catalog."default" NOT NULL,
    senha character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT usuarios_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS convidados.usuarios
    OWNER to postgres;


CREATE SEQUENCE convidados.criticas_id_seq;

CREATE TABLE convidados.criticas
(
    id integer NOT NULL DEFAULT nextval('convidados.criticas_id_seq'::regclass),
    "FK_usuario" integer NOT NULL,
    "FK_convidado" integer NOT NULL,
    nota smallint NOT NULL,
    comentario text,
    data_criacao time without time zone NOT NULL,
    data_atualizacao time without time zone NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_usuario FOREIGN KEY ("FK_usuario")
        REFERENCES convidados.usuarios (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT fk_convidados FOREIGN KEY ("FK_convidado")
        REFERENCES convidados.convidados (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)
WITH (
    OIDS = FALSE
);

ALTER TABLE IF EXISTS convidados.criticas
    OWNER to postgres;