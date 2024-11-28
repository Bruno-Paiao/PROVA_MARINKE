-- A
SELECT f.nome_funcionario AS nomeFuncionario, m.numero_mesa AS mesaAtendida,

SUM(pg.valor_total) AS TotalGasto

FROM funcionario f
INNER JOIN mesa m ON f.id_funcionario = m.id_funcionario
INNER JOIN pedido p ON m.idMesa = p.id_mesa
INNER JOIN pagamento pg ON p.idPedido  = pg.id_pedido

GROUP BY f.nome_funcionario, m.numero_mesa;


-- B
SELECT m.numero_mesa AS NumeroMesa, p.nome_produto AS Produtos, pp.quantidade AS Quantidade,
(p.preco_unitario * pp.quantidade) AS ValorTotal

FROM mesa m

INNER JOIN pedido pd ON m.idMesa = pd.id_mesa
INNER JOIN pedido_produto pp ON pd.idPedido = pp.id_pedido
INNER JOIN produto p ON pp.id_produto = p.idProduto

WHERE m.numero_mesa = 3


-- C
DELIMITER $$

CREATE PROCEDURE RedefinirStatusMesa(

IN p_numero_mesa INT 

)

BEGIN 

UPDATE mesa 
SET status_mesa = 'livre'
WHERE numero_mesa = p_numero_mesa;


SELECT CONCAT('status da mesa--', p_numero_mesa , '--edefinido para livre') AS Mensagem;

END;

DELIMITER $$

CALL RedefinirStatusMesa(1);