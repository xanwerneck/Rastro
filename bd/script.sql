
SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

CREATE SCHEMA puc_rastro;
ALTER SCHEMA puc_rastro OWNER TO postgres;

SET search_path = puc_rastro, pg_catalog;

CREATE SEQUENCE sq_id_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_usuario OWNER TO postgres; 

CREATE TABLE  Usuario (
 id_usuario integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_usuario'::regclass),
 nome_usuario character varying(100),
 email_usuario character varying(150),
 telefone_usuario character varying(50),
 senha_usuario character varying(20),
 sobrenome_usuario character varying(100),
 CONSTRAINT pk_id_usuario PRIMARY KEY (id_usuario)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Usuario
  OWNER TO postgres;

CREATE SEQUENCE sq_id_projeto
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_projeto OWNER TO postgres; 

CREATE TABLE  Projeto (
 id_projeto integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_projeto'::regclass),
 desc_projeto character varying(1000),
 dt_inicio date,
 status_projeto character varying(1),
 nome_projeto character varying(150),
 CONSTRAINT pk_id_projeto PRIMARY KEY (id_projeto)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Projeto
  OWNER TO postgres;

CREATE SEQUENCE sq_id_tp_naofuncional
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_tp_naofuncional OWNER TO postgres; 

CREATE TABLE  TipoNaoFuncional (
 id_tp_naofuncional integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_tp_naofuncional'::regclass),
 desc_tp_naofuncional character varying(50),
 CONSTRAINT pk_id_tp_naofuncional PRIMARY KEY (id_tp_naofuncional)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.TipoNaoFuncional
  OWNER TO postgres;

CREATE SEQUENCE sq_id_tipo_atividade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_tipo_atividade OWNER TO postgres; 

CREATE TABLE  Tipo_Atividade (
 id_tipo_atividade integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_tipo_atividade'::regclass),
 desc_tipo_atividade character varying(50),
 CONSTRAINT pk_id_tipo_atividade PRIMARY KEY (id_tipo_atividade)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Tipo_Atividade
  OWNER TO postgres;

CREATE SEQUENCE sq_id_rpd
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_rpd OWNER TO postgres; 

CREATE TABLE  Rpd (
 id_rpd integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_rpd'::regclass),
 desc_rpd character varying(500),
 status_rpd character varying(1),
 tipo_rpd character varying(1),
 CONSTRAINT pk_id_rpd PRIMARY KEY (id_rpd)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Rpd
  OWNER TO postgres;

CREATE SEQUENCE sq_id_tipo_artefato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_tipo_artefato OWNER TO postgres; 

CREATE TABLE  Tipo_Artefato (
 id_tipo_artefato integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_tipo_artefato'::regclass),
 desc_tipo_artefato character varying(150),
 CONSTRAINT pk_id_tipo_artefato PRIMARY KEY (id_tipo_artefato)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Tipo_Artefato
  OWNER TO postgres;

CREATE SEQUENCE sq_id_artefato
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_artefato OWNER TO postgres; 

CREATE TABLE  Artefato (
 id_artefato integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_artefato'::regclass),
 nome_artefato character varying(150),
 dt_criacao timestamp,
 status_artefato character varying(1),
 id_tipo_artefato_fk integer, 
 CONSTRAINT pk_id_artefato PRIMARY KEY (id_artefato),
 CONSTRAINT fk_id_tipo_artefato_art FOREIGN KEY (id_tipo_artefato_fk)
      REFERENCES puc_rastro.Tipo_Artefato(id_tipo_artefato) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Artefato
  OWNER TO postgres;

CREATE SEQUENCE sq_id_atividade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_atividade OWNER TO postgres; 


CREATE TABLE  Atividade (
id_atividade integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_atividade'::regclass),
 nome_atividade character varying(250),
 dt_inclusao timestamp,
 dt_atualizacao timestamp,
 dt_ativ_inicio date,
 dt_ativ_fim    date,
 status_atividade character varying(1),
 fase_atividade character varying(1),
 tempo_esforco_hora integer,
 tempo_esforco_min integer,
 id_projeto_fk integer,
 CONSTRAINT pk_id_atividade PRIMARY KEY (id_atividade),
 CONSTRAINT fk_id_projeto_ati FOREIGN KEY (id_projeto_fk)
      REFERENCES puc_rastro.Projeto(id_projeto) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Atividade
  OWNER TO postgres;

CREATE SEQUENCE sq_id_tipo_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_tipo_usuario OWNER TO postgres; 

CREATE TABLE  Tipo_Usuario (
id_tipo_usuario integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_tipo_usuario'::regclass),
 desc_tipo_usuario character varying(150),
 CONSTRAINT pk_id_tipo_usuario PRIMARY KEY (id_tipo_usuario)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Tipo_Usuario
  OWNER TO postgres;

CREATE SEQUENCE sq_id_arquivo
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	ALTER TABLE puc_rastro.sq_id_arquivo OWNER TO postgres; 

CREATE TABLE  Arquivo (
 id_arquivo integer NOT NULL DEFAULT nextval('puc_rastro.sq_id_arquivo'::regclass),
 nome_arquivo character varying(150),
 dt_arquivo timestamp,
 ext_arquivo character varying(50),
 id_artefato_fk integer,
 CONSTRAINT pk_id_arquivo PRIMARY KEY (id_arquivo),
 CONSTRAINT fk_id_artefato_arq FOREIGN KEY (id_artefato_fk)
      REFERENCES puc_rastro.Artefato(id_artefato) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Arquivo
  OWNER TO postgres;

CREATE TABLE Projeto_Usuario (
 id_usuario_fk integer,
 id_projeto_fk integer,
CONSTRAINT fk_id_usuario_pro_usu FOREIGN KEY (id_usuario_fk)
      REFERENCES puc_rastro.Usuario(id_usuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_id_projeto_pro_usu FOREIGN KEY (id_projeto_fk)
      REFERENCES puc_rastro.Projeto(id_projeto) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Projeto_Usuario
  OWNER TO postgres;

CREATE TABLE Rpd_NaoFuncional (
 id_tp_naofuncional_fk integer,
 id_rpd_fk integer,
CONSTRAINT fk_id_tp_naofuncional_rpd_nao FOREIGN KEY (id_tp_naofuncional_fk)
      REFERENCES puc_rastro.TipoNaoFuncional(id_tp_naofuncional) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_id_rpd_fk_rpd_nao FOREIGN KEY (id_rpd_fk)
      REFERENCES puc_rastro.Rpd(id_rpd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Rpd_NaoFuncional
  OWNER TO postgres;

CREATE TABLE Atividade_Usuario (
 id_usuario_fk integer,
 id_atividade_fk integer,
CONSTRAINT fk_id_usuario_ati_usu FOREIGN KEY (id_usuario_fk)
      REFERENCES puc_rastro.Usuario(id_usuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_id_atividade_ati_usu FOREIGN KEY (id_atividade_fk)
      REFERENCES puc_rastro.Atividade(id_atividade) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Atividade_Usuario
  OWNER TO postgres;

CREATE TABLE  Simbolo (
 desc_simbolo character varying(250),
 id_atividade_fk integer,
 id_artefato_fk integer,
CONSTRAINT fk_id_atividade_sim FOREIGN KEY (id_atividade_fk)
      REFERENCES puc_rastro.Atividade(id_atividade) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_id_artefato_sim FOREIGN KEY (id_artefato_fk)
      REFERENCES puc_rastro.Artefato(id_artefato) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Simbolo
  OWNER TO postgres;

CREATE TABLE Atividade_Tipo_Atividade (
 id_tipo_atividade_fk integer,
 id_atividade_fk integer,
CONSTRAINT fk_id_atividade_atv_tp FOREIGN KEY (id_atividade_fk)
      REFERENCES puc_rastro.Atividade(id_atividade) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_id_tipo_atividade_atv_tp FOREIGN KEY (id_tipo_atividade_fk)
      REFERENCES puc_rastro.Tipo_Atividade(id_tipo_atividade) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Atividade_Tipo_Atividade
  OWNER TO postgres;

CREATE TABLE Usuario_Tipo_Usuario (
 id_tipo_usuario_fk integer,
 id_usuario_fk integer,
 CONSTRAINT fk_id_usuario_tp_usu FOREIGN KEY (id_usuario_fk)
      REFERENCES puc_rastro.Usuario(id_usuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_id_usuario_tipo_tp_usu FOREIGN KEY (id_tipo_usuario_fk)
      REFERENCES puc_rastro.Tipo_Usuario(id_tipo_usuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Usuario_Tipo_Usuario
  OWNER TO postgres;

CREATE TABLE Rpd_Artefato (
 id_artefato_fk integer,
 id_rpd_fk integer,
 CONSTRAINT fk_id_artefato_rpd_art FOREIGN KEY (id_artefato_fk)
      REFERENCES puc_rastro.Artefato(id_artefato) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
 CONSTRAINT fk_id_rpd_rpd_art FOREIGN KEY (id_rpd_fk)
      REFERENCES puc_rastro.Rpd(id_rpd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Rpd_Artefato
  OWNER TO postgres;

CREATE TABLE Rpd_Atividade (
 id_atividade_fk integer,
 id_rpd_fk integer,
CONSTRAINT fk_id_atividade_rpd_ati FOREIGN KEY (id_atividade_fk)
      REFERENCES puc_rastro.Atividade(id_atividade) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
CONSTRAINT fk_id_rpd_rpd_ati FOREIGN KEY (id_rpd_fk)
      REFERENCES puc_rastro.Rpd(id_rpd) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE  puc_rastro.Rpd_Atividade
  OWNER TO postgres;
