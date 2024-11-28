-- Criando as tabelas
CREATE TABLE if NOT EXISTS Cliente (
  id_cliente INT PRIMARY KEY,
  nome VARCHAR(45)
);

CREATE TABLE if NOT EXISTS Funcionario (
    id_funcionario INT PRIMARY KEY,
    nome VARCHAR(45)
);

CREATE TABLE if NOT EXISTS Produto (
  id_produto INT PRIMARY KEY,
  nome VARCHAR(45),
  preco_unitario DECIMAL,
  estoque_quant INT,
  estoque_min INT,
  marca VARCHAR(45)
);

CREATE TABLE if NOT EXISTS Pedido (
  id_pedido INT PRIMARY KEY,
  data_hora DATETIME
  FOREIGN KEY (id_mesa) REFERENCES Mesa(id_mesa)
);

CREATE TABLE if NOT EXISTS Mesa (
  id_mesa INT PRIMARY KEY,
  status VARCHAR(45),
  id_pedido INT,
);

CREATE TABLE if NOT EXISTS Mesa_Cliente (
    id_mesa_cliente INT PRIMARY KEY,
    id_cliente INT,
    id_mesa INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa)
);

CREATE TABLE if NOT EXISTS Mesa_Funcionario (
    id_mesa_funcionario INT PRIMARY KEY,
    id_funcionario INT,
    id_mesa INT,
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario),
    FOREIGN KEY (id_mesa) REFERENCES mesa(id_mesa)
);

CREATE TABLE if NOT EXISTS Pedido_Pedido (
  id_pedido_pedido INT PRIMARY KEY,
  quantidade INT,
  id_pedido INT,
  id_produto INT
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
  FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);

CREATE TABLE if NOT EXISTS Pagamento (
  id_forma_pagamento INT PRIMARY KEY,
  descricao VARCHAR(45)
);

CREATE TABLE if NOT EXISTS Fechamento (
  id_fechamento INT PRIMARY KEY,
  id_pedido INT,
  id_forma_pagamento INT,
  valor_total DOUBLE,
  data_hora DATETIME,
  FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido),
  FOREIGN KEY (id_forma_pagamento) REFERENCES Forma_Pagamento(id_forma_pagamento)
);