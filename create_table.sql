USE evacina;

CREATE TABLE CIDADAOS 
(
	id_ci INT NOT NULL,
    cpf_ci CHAR(11) NOT NULL,
    nome_ci VARCHAR(100) NOT NULL,
    email_ci VARCHAR(100) NOT NULL, 
    celular_ci VARCHAR(11) NOT NULL,
    telefone_ci CHAR(10),
    endereco_ci INT NOT NULL, 
    data_nascimento DATE NOT NULL
);

CREATE TABLE FUNCIONARIOS 
(
	id_fu INT NOT NULL,
    id_ci INT NOT NULL,
    cod_fu INT NOT NULL
);

CREATE TABLE POSTOS_VACINACAO
(
	id_po INT NOT NULL,
    nome_po VARCHAR(100) NOT NULL,
    endereco_po INT NOT NULL,
    telefone_po CHAR(10) NOT NULL
);

CREATE TABLE PRODUTORES_VACINAS 
(
	id_pr INT NOT NULL,
    nome_pr VARCHAR(100)
);

CREATE TABLE LOTES
(
	id_lo INT NOT NULL,
    id_pr INT NOT NULL,
    numero_lo INT NOT NULL,
    patogeno_lo VARCHAR(50) NOT NULL, 
    data_fabricacao_lo DATE NOT NULL,
    data_validade_lo DATE NOT NULL,
    quantidade_lo INT NOT NULL,
    doses_necessarias_lo INT NOT NULL,
    intervalo_doses_lo INT NOT NULL
);

CREATE TABLE VACINAS
(
	id_va INT NOT NULL,
    id_lo INT NOT NULL,
    id_po INT NOT NULL,
    registro_va INT NOT NULL
);

CREATE TABLE ENDERECOS
(
	id_en INT NOT NULL,
    estado_en CHAR(2) NOT NULL,
    cidade_en VARCHAR(100) NOT NULL,
    cep CHAR(8) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    complemento VARCHAR(50) NOT NULL
);

CREATE TABLE TRABALHA_EM
(
	id_fu INT NOT NULL,
    id_po INT NOT NULL
);

CREATE TABLE APLICA
(
	id_ci INT NOT NULL,
    id_fu INT NOT NULL,
    id_va INT NOT NULL,
    id_po INT NOT NULL,
    data_ap DATE NOT NULL
);

