CREATE TABLE `usuarios` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `senha` varchar(255) NOT NULL,
  `telefone` varchar(20),
  `cpf` varchar(14) UNIQUE NOT NULL,
  `endereco` varchar(255),
  `cargo` varchar(50),
  `status` varchar(20),
  `perfil` varchar(50),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `clientes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cpf_cnpj` varchar(20) UNIQUE NOT NULL,
  `email` varchar(100),
  `telefone` varchar(20),
  `endereco` varchar(255),
  `cidade` varchar(50),
  `estado` varchar(50),
  `cep` varchar(10),
  `data_nascimento` date,
  `tipo` varchar(20),
  `profissao` varchar(50),
  `renda_mensal` decimal(10,2),
  `status` varchar(20),
  `observacoes` text,
  `usuario_id` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `fornecedor` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(18) UNIQUE NOT NULL,
  `telefone` varchar(20),
  `email` varchar(100),
  `endereco` varchar(255),
  `cidade` varchar(50),
  `estado` varchar(50),
  `status` varchar(20),
  `observacoes` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `receitas` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_recebimento` date NOT NULL,
  `categoria` varchar(50),
  `cliente_id` int,
  `forma_pagamento` varchar(50),
  `status` varchar(20),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `despesas` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_pagamento` date NOT NULL,
  `categoria` varchar(50),
  `fornecedor_id` int,
  `forma_pagamento` varchar(50),
  `status` varchar(20),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `controle_contatos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` int,
  `tipo_contato` varchar(50) NOT NULL,
  `contato` varchar(100) NOT NULL,
  `observacao` text,
  `data_contato` date,
  `responsavel` varchar(50),
  `status` varchar(20),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `controle_banco` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `nome_banco` varchar(100) NOT NULL,
  `agencia` varchar(20) NOT NULL,
  `conta` varchar(20) NOT NULL,
  `tipo_conta` varchar(50),
  `saldo` decimal(12,2),
  `gerente` varchar(50),
  `telefone` varchar(20),
  `status` varchar(20),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `controle_cartoes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `numero_cartao` varchar(20) NOT NULL,
  `titular` varchar(100) NOT NULL,
  `validade` date NOT NULL,
  `limite` decimal(10,2),
  `banco_id` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `controle_contas` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_vencimento` date NOT NULL,
  `status` varchar(20),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `controle_pagamentos` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `conta_id` int,
  `data_pagamento` date NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` varchar(50),
  `status` varchar(20),
  `observacao` text,
  `usuario_id` int,
  `created_at` timestamp,
  `updated_at` timestamp
);

ALTER TABLE `clientes` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `receitas` ADD FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

ALTER TABLE `despesas` ADD FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`);

ALTER TABLE `controle_contatos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`);

ALTER TABLE `controle_cartoes` ADD FOREIGN KEY (`banco_id`) REFERENCES `controle_banco` (`id`);

ALTER TABLE `controle_pagamentos` ADD FOREIGN KEY (`conta_id`) REFERENCES `controle_contas` (`id`);

ALTER TABLE `controle_pagamentos` ADD FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
