INSERT INTO `PATOGENO` (`cod_pa`, `nome_pa`) VALUES
(1, 'Covid'),
(2, 'Catapora'),
(3, 'Poliomelite'),
(4, 'Influenza');

INSERT INTO `POSTO_VACINACAO` (`cod_po`, `nome_po`, `estado_po`, `cidade_po`, `bairro_po`, `endereco_po`, `telefone_po`) VALUES
(1, 'Posto da Tijuca', 'RJ', 'Rio de Janeiro', 'Tijuca', 'Rua Uruguai 321', '2122032514'),
(2, 'Posto de Copacabana', 'RJ', 'Rio de Janeiro', 'Copacabana', 'Rua João da Costa 82', '2122365478'),
(3, 'Posto da Cantareira', 'RJ', 'Niterói', 'São Domingos', 'Rua da Cantareira 30', '2230124578'),
(4, 'Posto do Flamengo', 'RJ', 'Rio de Janeiro', 'Flamengo', 'Praia do Flamengo 220', '2120543658');

INSERT INTO `PRODUTOR_VACINAS` (`cod_pr`, `nome_pr`) VALUES
(1, 'Butantan'),
(2, 'FioCruz');

INSERT INTO `VACINA` (`cod_va`, `nome_va`, `laboratorio_va`, `doses_necessarias_va`, `intervalo_doses_va`) VALUES
(1, 'CoronaVac', 'China Lab', 2, 14),
(2, 'Pfizer Vaccine', 'Pfizer', 1, NULL),
(3, 'Varicela', 'Lab+', 2, 64);

INSERT INTO `LOTE` (`cod_lo`, `cod_pr_lo`, `cod_va_lo`, `data_fabricacao_lo`, `data_validade_lo`) VALUES
(1, 1, 1, '2021-04-22', '2023-01-06'),
(2, 2, 2, '2021-04-08', '2024-04-01');

INSERT INTO `FRASCO` (`cod_fr`, `cod_lo_fr`, `cod_po_fr`, `usado_fr`) VALUES
(1, 1, 3, 0),
(2, 1, 2, 0),
(3, 2, 1, 0),
(4, 2, 1, 0);

INSERT INTO `CIDADAO` (`cpf_ci`, `nome_ci`, `email_ci`, `celular_ci`, `telefone_ci`, `data_nascimento_ci`, `estado_ci`, `cidade_ci`, `bairro_ci`, `endereco_ci`) VALUES
('02415478542', 'Antonio Romano Carvalho Ferreira', 'romano@gmail.com', '21995779544', '2122083545', '1999-02-18', 'MA', 'São Luís', 'Calhau', 'rua dos afogados 400'),
('06104235878', 'João Medeiros Prata', 'joao.prata@gmail.com', '2288445623', NULL, '1980-05-19', 'RJ', 'Rio de Janeiro', 'Centro', 'Rua do Abismo 32'),
('12197920715', 'Heloisa Lara Beatriz Pereira', 'heloisa@yahoo.com.br', '21982171822', NULL, '1959-09-26', 'RJ', 'Rio de Janeiro', 'Colégio', 'Rua Paulo Cesar 757'),
('22364203740', 'Heitor Murilo de Paula', 'heitormdp@hotmail.com', '21973725028', NULL, '1995-11-06', 'RJ', 'Rio de Janeiro', 'Campo Grande', 'Rua Wolf Klabin'),
('53799598731', 'Yuri Hugo Henry da Cunha', 'yurihugo@gmail.com', '21991848329', NULL, '1958-05-24', 'RJ', 'Rio de Janeiro', 'Ramos', 'Rua Doutor Alberto Nepomuceno 882'),
('61458232751', 'Carlos Eduardo Marcelo Araújo', 'carlosEMA@gmail.com', '21999951572', NULL, '1970-05-19', 'RJ', 'Rio de Janeiro', 'Realengo', 'Rua Humberto de Vasconcelos 934'),
('68037355756', 'Kaique Enrico Moura', 'kaiqueenrico@hotmail.com', '21987467989', NULL, '1973-05-20', 'RJ', 'Rio de Janeiro', 'Vista Alegre', 'Avenida São Félix'),
('78759682752', 'Vitória Liz Josefa Brito', 'vitoria@gmail.com', '21981418391', NULL, '1987-08-17', 'RJ', 'Rio de Janeiro', 'Vila Valqueire', 'Praça Márcia Mendes 578'),
('85475695620', 'Armando Nogueira', 'armando@outlook.com', '2188457565', NULL, '1961-04-02', 'RJ', 'Rio de Janeiro', 'Tijuca', 'Rua Conde Bonfim 454'),
('92356874510', 'Laís Nascimento de Souza', 'laissouza20@gmail.com', '2145786598', NULL, '1992-04-21', 'SP', 'São Paulo', 'Centro', 'Travessa do Gavião 412'),
('99547854123', 'Keyla Macedo Salgado', 'keyla@hotmail.com', '2188564512', NULL, '2001-01-19', 'RJ', 'Rio de Janeiro', 'Meier', 'Rua dos afogados 11');

INSERT INTO `FUNCIONARIO` (`cod_fu`, `cpf_ci_fu`) VALUES
(2, '02415478542'),
(3, '12197920715'),
(4, '68037355756');

INSERT INTO `IMUNIZA_CONTRA` (`cod_va_ic`, `cod_pa_ic`) VALUES
(1, 1),
(2, 1),
(3, 2);

INSERT INTO `TRABALHA_EM` (`cod_fu_te`, `cod_po_te`) VALUES
(2, 1),
(2, 3);

INSERT INTO `APLICA` (`cpf_ci_ap`, `cod_fu_ap`, `cod_fr_ap`, `data_ap`) VALUES
('06104235878', 2, 2, '2021-04-22');