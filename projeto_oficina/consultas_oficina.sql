-- listar todos os clientes
select * 
from cliente;

-- listar todos os clientes com seus veículos
select concat(c.nome, ' ', c.sobrenome) as cliente, v.modelo, v.placa
from cliente c
join veiculo v on c.id_cliente = v.id_cliente
order by c.nome;

-- calcular o valor total de cada ordem de serviço (somando serviços e peças)
select o.id_ordem,
       sum(coalesce(isv.quantidade * isv.valor, 0) + coalesce(ip.quantidade * ip.valor, 0)) as valor_total
from ordem_servico o
left join itens_servico isv on o.id_ordem = isv.id_ordem
left join itens_peca ip on o.id_ordem = ip.id_ordem
group by o.id_ordem;

-- listar peças com estoque baixo
select nome, quantidade_estoque
from peca
where quantidade_estoque < 10
order by quantidade_estoque asc;

-- contar veículos por cliente
select concat(c.nome, ' ', c.sobrenome) as cliente, count(v.id_veiculo) as total_veiculos
from cliente c
join veiculo v on c.id_cliente = v.id_cliente
group by c.id_cliente
having total_veiculos > 1;

-- descrever o status das ordens de serviço usando case
select id_ordem, status,
case
    when status = 'aberta' then 'ordem pendente'
    when status = 'andamento' then 'em execução'
    when status = 'fechada' then 'finalizada'
    else 'status indefinido'
end as descricao_status
from ordem_servico;

-- total faturado por funcionário
select concat(f.nome, ' ', f.sobrenome) as funcionario, sum(o.valor_total) as total_faturado
from funcionario f
join ordem_servico o on f.id_funcionario = o.id_funcionario
group by f.id_funcionario;

-- serviços mais realizados
select s.descricao, count(isv.id_servico) as total
from servico s
join itens_servico isv on s.id_servico = isv.id_servico
group by s.id_servico
order by total desc;

-- peças mais utilizadas
select p.nome, sum(ip.quantidade) as total_usadas
from peca p
join itens_peca ip on p.id_peca = ip.id_peca
group by p.id_peca
order by total_usadas desc;

-- clientes que mais gastaram em serviços
select concat(c.nome, ' ', c.sobrenome) as cliente, sum(o.valor_total) as total_gasto
from cliente c
join ordem_servico o on c.id_cliente = o.id_cliente
group by c.id_cliente
order by total_gasto desc;

-- ordens abertas com mais de um serviço
select o.id_ordem, count(isv.id_servico) as qtd_servicos
from ordem_servico o
join itens_servico isv on o.id_ordem = isv.id_ordem
where o.status = 'aberta'
group by o.id_ordem
having qtd_servicos > 1;
