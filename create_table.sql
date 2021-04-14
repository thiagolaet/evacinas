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
	id_po INT NOT NULL,
    nome_po VARCHAR(100) NOT NULL,
    estado_po CHAR(2) NOT NULL,
	cidade_po VARCHAR(100) NOT NULL,
    bairro_po VARCHAR(100) NOT NULL,
    endereco_po VARCHAR(100) NOT NULL,
    telefone_po CHAR(10) NOT NULL
);

CREATE TABLE PRODUTOR_VACINAS
(
	id_pr INT NOT NULL,
    nome_pr VARCHAR(100)
);

CREATE TABLE VACINA
(
	id_va INT NOT NULL,
    nome_va VARCHAR(100) NOT NULL,
    patogeno_va VARCHAR(100) NOT NULL,
	doses_necessarias_va INT NOT NULL,
    intervalo_doses_va INT NOT NULL
);

CREATE TABLE LOTE
(
	id_lo INT NOT NULL,
    id_pr_lo INT NOT NULL,
    codigo_lo INT NOT NULL,
    id_va_lo INT NOT NULL, 
    data_fabricacao_lo DATE NOT NULL,
    data_validade_lo DATE NOT NULL
);

CREATE TABLE FRASCO
(
	id_fr INT NOT NULL,
    id_lo_fr INT NOT NULL,
    registro_fr INT NOT NULL,
	id_po_fr INT NOT NULL
);

CREATE TABLE TRABALHA_EM
(
	cod_fu_te INT NOT NULL,
    id_po_te INT NOT NULL
);

CREATE TABLE APLICA
(
	cpf_ci_ap INT NOT NULL,
    cod_fu_ap INT NOT NULL,
    id_fr_ap INT NOT NULL,
    data_ap DATE NOT NULL
);