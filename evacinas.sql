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
    endereco_ci VARCHAR(100) NOT NULL
);


CREATE TABLE FUNCIONARIO 
(
	cod_fu INT NOT NULL,
    cpf_ci_fu CHAR(11) NOT NULL
);

CREATE TABLE POSTO_VACINACAO
(
	cod_po INT NOT NULL,
    nome_po VARCHAR(100) NOT NULL,
    estado_po CHAR(2) NOT NULL,
	cidade_po VARCHAR(100) NOT NULL,
    bairro_po VARCHAR(100) NOT NULL,
    endereco_po VARCHAR(100) NOT NULL,
    telefone_po CHAR(10) NOT NULL
);

CREATE TABLE PRODUTOR_VACINAS
(
	cod_pr INT NOT NULL,
    nome_pr VARCHAR(100) NOT NULL
);

CREATE TABLE LOTE
(
	cod_lo INT NOT NULL,
    cod_pr_lo INT NOT NULL,
    cod_va_lo INT NOT NULL, 
    data_fabricacao_lo DATE NOT NULL,
    data_validade_lo DATE NOT NULL
);

CREATE TABLE FRASCO
(
	cod_fr INT NOT NULL,
    cod_lo_fr INT NOT NULL,
    cod_po_fr INT NOT NULL
);

CREATE TABLE PATOGENO 
(
	cod_pa INT NOT NULL,
    nome_pa VARCHAR(100) NOT NULL
);

CREATE TABLE VACINA
(
	cod_va INT NOT NULL,
    nome_va VARCHAR(100) NOT NULL,
    laboratorio_va VARCHAR(100) NOT NULL,
	doses_necessarias_va INT NOT NULL,
    intervalo_doses_va INT
);

CREATE TABLE IMUNIZA_CONTRA 
(
	cod_va_ic INT NOT NULL,
    cod_pa_ic INT NOT NULL
);

CREATE TABLE TRABALHA_EM
(
	cod_fu_te INT NOT NULL,
    cod_po_te INT NOT NULL
);

CREATE TABLE APLICA
(
	cpf_ci_ap CHAR(11) NOT NULL,
    cod_fu_ap INT NOT NULL,
    cod_fr_ap INT NOT NULL,
    data_ap DATE NOT NULL
);