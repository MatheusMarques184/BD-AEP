
CREATE TABLE AEP.responsavel (
                registro_responsavel VARCHAR2 NOT NULL,
                nome_responsavel VARCHAR2 NOT NULL,
                RG_responsavel NUMBER NOT NULL,
                CPF_responsavel NUMBER NOT NULL,
                celular_responsavel NUMBER NOT NULL,
                endereco_responsavel VARCHAR2 NOT NULL,
                senha_responsavel VARCHAR2 NOT NULL,
                salario_responsavel FLOAT NOT NULL,
                CONSTRAINT REGISTRO_RESPONSAVEL PRIMARY KEY (registro_responsavel)
);


CREATE TABLE AEP.agricultor (
                CPF_agricultor NUMBER NOT NULL,
                nomecompleto_agricultor VARCHAR2 NOT NULL,
                anonascimento_agricultor NUMBER NOT NULL,
                celular_agricultor NUMBER NOT NULL,
                email_agricultor VARCHAR2 NOT NULL,
                senha_agricultor VARCHAR2 NOT NULL,
                CONSTRAINT CPF_AGRICULTOR PRIMARY KEY (CPF_agricultor)
);


CREATE TABLE AEP.cooperativa (
                CNPJ VARCHAR2 NOT NULL,
                nome_cooperativa VARCHAR2 NOT NULL,
                demanda_cooperativa VARCHAR2 NOT NULL,
                quantidade_demanda_cooperativa FLOAT NOT NULL,
                senha_cooperativa VARCHAR2 NOT NULL,
                CONSTRAINT NOME_COOPERATIVA PRIMARY KEY (CNPJ)
);


CREATE TABLE AEP.adubo (
                marca_dubo VARCHAR2 NOT NULL,
                tipo_adubo VARCHAR2 NOT NULL,
                curacao_adubo NUMBER NOT NULL,
                quantidade_adubo FLOAT NOT NULL,
                CONSTRAINT ADUBO_PK PRIMARY KEY (marca_dubo)
);


CREATE TABLE AEP.cultura (
                tipo_cultura VARCHAR2 NOT NULL,
                ciclo_plantio NUMBER NOT NULL,
                descanso_pos_plantio NUMBER NOT NULL,
                nome_dubo VARCHAR2 NOT NULL,
                CONSTRAINT CULTURA_PK PRIMARY KEY (tipo_cultura)
);


CREATE SEQUENCE LOTE_ID_LOTE_SEQ;

CREATE TABLE AEP.lote (
                id_lote NUMBER NOT NULL,
                hectares_lote FLOAT NOT NULL,
                tipo_cultura VARCHAR2 NOT NULL,
                CONSTRAINT ID_LOTE PRIMARY KEY (id_lote)
);


CREATE SEQUENCE ALOCACAO_ID_ALOCACAO_SEQ;

CREATE TABLE AEP.alocacao (
                id_alocacao NUMBER NOT NULL,
                registro_responsavel VARCHAR2 NOT NULL,
                CPF_agricultor NUMBER NOT NULL,
                CONSTRAINT ID_ALOCACAO PRIMARY KEY (id_alocacao)
);


CREATE TABLE AEP.lote_vendido (
                id_alocacao NUMBER NOT NULL,
                id_lote NUMBER NOT NULL,
                CNPJ VARCHAR2,
                CONSTRAINT LOTE_PK PRIMARY KEY (id_alocacao, id_lote)
);


ALTER TABLE AEP.alocacao ADD CONSTRAINT RESPONSAVEL2_RESPONSAVEL_FK
FOREIGN KEY (registro_responsavel)
REFERENCES AEP.responsavel (registro_responsavel)
NOT DEFERRABLE;

ALTER TABLE AEP.alocacao ADD CONSTRAINT AGRICULTOR_RESPONSAVEL_FK
FOREIGN KEY (CPF_agricultor)
REFERENCES AEP.agricultor (CPF_agricultor)
NOT DEFERRABLE;

ALTER TABLE AEP.lote_vendido ADD CONSTRAINT COOPERATIVA_LOTE_FK
FOREIGN KEY (CNPJ)
REFERENCES AEP.cooperativa (CNPJ)
NOT DEFERRABLE;

ALTER TABLE AEP.cultura ADD CONSTRAINT ADUBO_CULTURA_FK
FOREIGN KEY (nome_dubo)
REFERENCES AEP.adubo (marca_dubo)
NOT DEFERRABLE;

ALTER TABLE AEP.lote ADD CONSTRAINT CULTURA_LOTE_FK
FOREIGN KEY (tipo_cultura)
REFERENCES AEP.cultura (tipo_cultura)
NOT DEFERRABLE;

ALTER TABLE AEP.lote_vendido ADD CONSTRAINT LOTE_LOTE_FK
FOREIGN KEY (id_lote)
REFERENCES AEP.lote (id_lote)
NOT DEFERRABLE;

ALTER TABLE AEP.lote_vendido ADD CONSTRAINT ALOCA_AO_LOTE_FK
FOREIGN KEY (id_alocacao)
REFERENCES AEP.alocacao (id_alocacao)
NOT DEFERRABLE;
