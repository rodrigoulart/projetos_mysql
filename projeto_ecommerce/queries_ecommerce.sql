-- listar todos os clientes
select * 
from clients;

-- listar produtos infantis com review acima de 4, ordenados por review decrescente
select pname as product, category, review
from products
where classification_kids = true and review > 4
order by review desc;

-- total de pedidos por cliente
select c.fname as first_name, c.lname as last_name, count(o.idorder) as total_orders
from clients c
left join orders o on c.idclient = o.idorderclient
group by c.idclient;

-- total de itens e valor estimado de cada pedido
select o.idorder as order_id, sum(po.prodquantity) as total_items, sum(po.prodquantity * p.review) as estimated_value
from orders o
join productorder po on o.idorder = po.idorder
join products p on po.idproduct = p.idproduct
group by o.idorder;

-- clientes com mais de um tipo de pagamento
select c.fname as first_name, c.lname as last_name, count(p.idpayment) as payment_count
from clients c
join payments p on c.idclient = p.idpaymentclient
group by c.idclient
having payment_count > 1;

-- produtos com seus vendedores e quantidade disponível por vendedor
select pr.pname as product, s.socialname as seller, ps.quantity as seller_quantity
from products pr
join productseller ps on pr.idproduct = ps.idproduct
join sellers s on ps.idseller = s.idseller
order by ps.quantity desc;

-- total de estoque por produto com status derivado
select p.pname as product, sum(ps.quantity) as total_stock,
    case 
        when sum(ps.quantity) = 0 then 'out of stock'
        when sum(ps.quantity) < 10 then 'low stock'
        else 'in stock'
    end as stock_status
from products p
join productstorage ps on p.idproduct = ps.idproduct
group by p.idproduct
order by total_stock desc;

-- pedidos em andamento com nome do cliente e descrição
select o.idorder as order_id, c.fname as first_name, c.lname as last_name, o.orderdescription as description, o.orderstatus as status
from orders o
join clients c on o.idorderclient = c.idclient
where o.orderstatus = 'em processamento';

-- valor total de vendas por vendedor
select s.socialname as seller, sum(po.prodquantity * p.review) as total_sales
from sellers s
join productseller ps on s.idseller = ps.idseller
join products p on ps.idproduct = p.idproduct
join productorder po on p.idproduct = po.idproduct
group by s.idseller
order by total_sales desc;

-- verificar se algum vendedor também é fornecedor (comparando CNPJ)
select s.socialname as seller, f.socialname as supplier
from sellers s
join suppliers f on s.cnpj = f.cnpj;

-- média de review por categoria de produto
select category, avg(review) as avg_review, min(review) as min_review, max(review) as max_review
from products
group by category
order by avg_review desc;

-- quantidade de pedidos confirmados vs cancelados
select orderstatus as status, count(*) as total_orders
from orders
group by orderstatus;

-- produtos que nunca foram pedidos
select p.pname as product
from products p
left join productorder po on p.idproduct = po.idproduct
where po.idorder is null;

-- clientes que gastaram mais de 20 em pedidos
select c.fname as first_name, c.lname as last_name, sum(po.prodquantity * p.review) as total_spent
from clients c
join orders o on c.idclient = o.idorderclient
join productorder po on o.idorder = po.idorder
join products p on po.idproduct = p.idproduct
group by c.idclient
having total_spent > 20
order by total_spent desc;

-- lista de produtos, quantidade em estoque e quantidade vendida
select p.pname as product, sum(ps.quantity) as stock_quantity, coalesce(sum(po.prodquantity), 0) as sold_quantity,
    (sum(ps.quantity) - coalesce(sum(po.prodquantity),0)) as remaining_quantity
from products p
join productstorage ps on p.idproduct = ps.idproduct
left join productorder po on p.idproduct = po.idproduct
group by p.idproduct
order by remaining_quantity desc;

-- pagamentos por tipo e quantidade
select typepayment as payment_type, count(*) as payment_count, sum(limitavailable) as total_limit
from payments
group by typepayment;

-- clientes com pagamento em cartão e pix
select c.fname as first_name, c.lname as last_name
from clients c
join payments p on c.idclient = p.idpaymentclient
group by c.idclient
having sum(case when p.typepayment = 'Cartão' then 1 else 0 end) > 0
   and sum(case when p.typepayment = 'Pix' then 1 else 0 end) > 0;
