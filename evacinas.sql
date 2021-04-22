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
    ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT cpf_ci_fu_uk UNIQUE (cpf_ci_fu)
);

CREATE TABLE POSTO_VACINACAO
(
	cod_po INT NOT NULL,
    nome_po VARCHAR(100) NOT NULL,
    estado_po CHAR(2) NOT NULL,
	cidade_po VARCHAR(100) NOT NULL,
    bairro_po VARCHAR(100) NOT NULL,
    endereco_po VARCHAR(100) NOT NULL,
    telefone_po CHAR(10) NOT NULL,
    CONSTRAINT pk_po PRIMARY KEY (cod_po),
    CONSTRAINT endereco_po_uk UNIQUE (estado_po, cidade_po, bairro_po, endereco_po)
);

CREATE TABLE PRODUTOR_VACINAS
(
	cod_pr INT NOT NULL,
    nome_pr VARCHAR(100) UNIQUE NOT NULL,
    CONSTRAINT pk_pr PRIMARY KEY (cod_pr)
);

CREATE TABLE LOTE
(
	cod_lo INT NOT NULL,
    cod_pr_lo INT NOT NULL,
    cod_va_lo INT NOT NULL, 
    data_fabricacao_lo DATE NOT NULL,
    data_validade_lo DATE NOT NULL,
    CONSTRAINT pk_lo PRIMARY KEY (cod_lo, cod_pr_lo),
    CONSTRAINT fk_pr_lo FOREIGN KEY (cod_pr_lo) REFERENCES PRODUTOR_VACINAS(cod_pr)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_va_lo FOREIGN KEY (cod_va_lo) REFERENCES VACINA(cod_va)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE FRASCO
(
	cod_fr INT NOT NULL,
    cod_lo_fr INT NOT NULL,
    cod_po_fr INT NOT NULL,
    CONSTRAINT pk_fr PRIMARY KEY (cod_fr, cod_lo_fr),
    CONSTRAINT fk_lo_fr FOREIGN KEY (cod_lo_fr) REFERENCES LOTE(cod_lo)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_po_fr FOREIGN KEY (cod_po_fr) REFERENCES POSTO_VACINACAO(cod_po)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT unq_registro_lo UNIQUE (registro_fr, cod_lo_fr)
);

CREATE TABLE PATOGENO 
(
	cod_pa INT NOT NULL,
    nome_pa VARCHAR(100) NOT NULL,
    CONSTRAINT pk_pa PRIMARY KEY (cod_pa)
);

CREATE TABLE VACINA
(
	cod_va INT NOT NULL,
    nome_va VARCHAR(100) NOT NULL,
    laboratorio_va VARCHAR(100) NOT NULL,
	doses_necessarias_va INT NOT NULL,
    intervalo_doses_va INT DEFAULT 0 NOT NULL,
    CONSTRAINT pk_va PRIMARY KEY (cod_va)
);

CREATE TABLE IMUNIZA_CONTRA 
(
	cod_va_ic INT NOT NULL,
    cod_pa_ic INT NOT NULL,
    CONSTRAINT pk_ic PRIMARY KEY (cod_va_ic, cod_pa_ic),
    CONSTRAINT fk_va_ic FOREIGN KEY (cod_va_ic) REFERENCES VACINA(cod_va)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_pa_ic FOREIGN KEY (cod_pa_ic) REFERENCES PATOGENO (cod_pa)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE TRABALHA_EM
(
	cod_fu_te INT NOT NULL,
    cod_po_te INT NOT NULL,
    CONSTRAINT pk_te PRIMARY KEY (cod_fu_te, cod_po_te),
    CONSTRAINT fk_fu_te FOREIGN KEY (cod_fu_te) REFERENCES FUNCIONARIO(cod_fu)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_po_te FOREIGN KEY (cod_po_te) REFERENCES POSTO_VACINACAO(cod_po)
    ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE APLICA
(
	cpf_ci_ap CHAR(11) NOT NULL,
    cod_fu_ap INT NOT NULL,
    cod_fr_ap INT NOT NULL,
    data_ap DATE NOT NULL,
    CONSTRAINT pk_ap PRIMARY KEY(cpf_ci_ap, cod_fu_ap, cod_fr_ap),
    CONSTRAINT fk_ci_ap FOREIGN KEY (cpf_ci_ap) REFERENCES CIDADAO(cpf_ci)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_fu_ap FOREIGN KEY (cod_fu_ap) REFERENCES FUNCIONARIO(cod_fu)
    ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_fr_ap FOREIGN KEY (cod_fr_ap) REFERENCES FRASCO(cod_fr)
    ON UPDATE CASCADE ON DELETE RESTRICT
);