Create DATABASE evacina;

USE evacina;

CREATE TABLE CIDADAO 
(
    cpf_ci CHAR(11) NOT NULL,
    nome_ci VARCHAR(100) NOT NULL,
    email_ci VARCHAR(100) NOT NULL, 
    celular_ci VARCHAR(11) NOT NULL,
    telefone_ci CHAR(10),
    data_nascimento_ci DATE NOT NULL,
    estado_ci CHAR(2) NOT NULL,
    cidade_ci VARCHAR(100) NOT NULL,
    bairro_ci VARCHAR(100) NOT NULL,
    endereco_ci VARCHAR(100) NOT NULL,
    CONSTRAINT pk_ci PRIMARY KEY (cpf_ci)
);


CREATE TABLE FUNCIONARIO 
(
	cod_fu INT NOT NULL,
    cpf_ci_fu CHAR(11) NOT NULL,
    CONSTRAINT pk_fu PRIMARY KEY (cod_fu),
    CONSTRAINT fk_ci_fu FOREIGN KEY (cpf_ci_fu) REFERENCES CIDADAO(cpf_ci)
    ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE POSTO_VACINACAO
(
	id_po INT NOT NULL,
    nome_po VARCHAR(100) NOT NULL,
    estado_po CHAR(2) NOT NULL,
	cidade_po VARCHAR(100) NOT NULL,
    bairro_po VARCHAR(100) NOT NULL,
    endereco_po VARCHAR(100) UNIQUE NOT NULL,
    telefone_po CHAR(10) UNIQUE NOT NULL,
    CONSTRAINT pk_PO PRIMARY KEY (id_po)
);

CREATE TABLE PRODUTOR_VACINAS
(
	id_pr INT NOT NULL,
    nome_pr VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT pk_pr PRIMARY KEY (id_pr)
);

CREATE TABLE VACINA
(
	id_va INT NOT NULL,
    nome_va VARCHAR(100) NOT NULL,
    patogeno_va VARCHAR(100) NOT NULL,
	doses_necessarias_va INT NOT NULL,
    intervalo_doses_va INT DEFAULT 0 NOT NULL,
    CONSTRAINT pk_va PRIMARY KEY (id_va)
);

CREATE TABLE LOTE
(
	id_lo INT NOT NULL,
    id_pr_lo INT NOT NULL,
    codigo_lo VARCHAR(30) NOT NULL,
    id_va_lo INT NOT NULL, 
    data_fabricacao_lo DATE NOT NULL,
    data_validade_lo DATE NOT NULL,
    CONSTRAINT pk_lo PRIMARY KEY (id_lo),
    CONSTRAINT fk_pr_lo FOREIGN KEY (id_pr_lo) REFERENCES PRODUTOR_VACINAS(id_pr)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_va_lo FOREIGN KEY (id_va_lo) REFERENCES VACINA(id_va)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT unq_codigo_pr UNIQUE (codigo_lo, id_pr_lo)
);

CREATE TABLE FRASCO
(
	id_fr INT NOT NULL,
    id_lo_fr INT NOT NULL,
    registro_fr VARCHAR(30) NOT NULL,
    id_po_fr INT NOT NULL,
    CONSTRAINT pk_fr PRIMARY KEY (id_fr),
    CONSTRAINT fk_lo_fr FOREIGN KEY (id_lo_fr) REFERENCES LOTE(id_lo)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_po_fr FOREIGN KEY (id_po_fr) REFERENCES POSTO_VACINACAO(id_po)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT unq_registro_lo UNIQUE (registro_fr, id_lo_fr)
);

CREATE TABLE TRABALHA_EM
(
	cod_fu_te INT NOT NULL,
    id_po_te INT NOT NULL,
    CONSTRAINT pk_te PRIMARY KEY (cod_fu_te, id_po_te),
    CONSTRAINT fk_fu_te FOREIGN KEY (cod_fu_te) REFERENCES FUNCIONARIO(cod_fu)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_po_te FOREIGN KEY (id_po_te) REFERENCES POSTO_VACINACAO(id_po)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE APLICA
(
	cpf_ci_ap CHAR(11) NOT NULL,
    cod_fu_ap INT NOT NULL,
    id_fr_ap INT NOT NULL,
    data_ap DATE NOT NULL,
    CONSTRAINT pk_ap PRIMARY KEY(cpf_ci_ap, cod_fu_ap, id_fr_ap),
    CONSTRAINT fk_ci_ap FOREIGN KEY (cpf_ci_ap) REFERENCES CIDADAO(cpf_ci)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_fu_ap FOREIGN KEY (cod_fu_ap) REFERENCES FUNCIONARIO(cod_fu)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_fr_ap FOREIGN KEY (id_fr_ap) REFERENCES FRASCO(id_fr)
    ON UPDATE CASCADE ON DELETE RESTRICT
);