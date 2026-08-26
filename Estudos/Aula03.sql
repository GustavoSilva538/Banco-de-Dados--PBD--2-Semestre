select *
from payment;

select sum(amount)
from payment;

--Desenvolva ema função para gerar o nome completo do cliente
select concat(first_name, ' ',last_name)
from customer
where customer_id = 2;

create function nome_comp2(id int)
returns char(50)
deterministic
begin
declare nome char(50);
select concat(first_name, ' ',last_name) into nome
from customer
where customer_id = id;
return nome;
end;

select nome_comp(5);

select customer_id, nome_comp2(customer_id), amount
from payment;

-- Faça uma função para retornar o desconto 5% quando o tottal pago pelo cliente for maior igual que 30,00
-- 3% quando for menor

create function soma_pagamentos(id int)
returns decimal(10, 2)
deterministic
begin
declare total_pago decimal (10, 2);
select sum(amount)
into total_pago
from payment
where customer_id = id;
if total_pago >= 30.00 then
    return total_pago * 0.05;
else 
    return total_pago * 0.03;
end if;
end;

select soma_pagamentos(78);

CREATE Function comissao5 (id int)
RETURNS decimal(10, 2)
deterministic
begin
declare comissao decimal(10, 2);
declare total decimal (10, 2);
SELECT sum(amount) into total
FROM payment
WHERE customer_id = id;
if total >= 30 THEN
set comissao = total * 0.05;
ELSE 
set comissao = total * 0.03;
end if;
return comissao;
end;

select comissao5(78);

CREATE Function comissao8 (id int)
RETURNS decimal(10, 2)
deterministic
begin
declare comissao decimal(10, 2);
declare total decimal (10, 2);
declare texto varchar(70);
SELECT sum(amount) into total
FROM payment
WHERE customer_id = id;
if total >= 30 THEN
set comissao = total * 0.05;
ELSE 
set comissao = total * 0.03;
end if;
set texto = CONCAT(nome_comp2(id), ' ', FORMAT(total,2), ' ', format(comissao,2));
return texto;
end;

select comissao8(2);

/* Desenvolva uma função para calcular o Total de comissão paga para cada gerente por um cliente
sendo 7% para o gerente de codigo 2, e 4,5% para o gerente de codigo 1
*/

CREATE Function calculoGerente7 (id int)
RETURNS decimal(10, 2)
deterministic
begin
declare comissao decimal(10, 2);
declare total decimal (10, 2);
SELECT sum(payment.amount) into total
FROM payment
inner join staff on payment.staff_id = staff.staff_id
WHERE staff.staff_id = id;
    if id = 1 THEN
        set comissao = total * 0.07;
    ELSEIF staff_id = 2 THEN
        set comissao = total * 0.45;
    else 
        set comissao = 0.00;
end if;
return comissao;
end;

select calculoGerente7(2);


CREATE FUNCTION calculoGerente10(id INT, gerente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE comissao DECIMAL(10,2);
    DECLARE total DECIMAL(10,2);
    SELECT SUM(amount) INTO total
    FROM payment
    WHERE customer_id = id
    AND staff_id = gerente;
    IF gerente = 2 THEN
        SET comissao = total * 0.07;
    ELSEIF gerente = 1 THEN
        SET comissao = total * 0.045;
    ELSE
        SET comissao = 0.00;
    END IF;
    RETURN comissao;
END;

SELECT 
    customer_id,
    staff_id,
    calculoGerente10(customer_id, staff_id) AS comissao
FROM payment
GROUP BY customer_id, staff_id;


select staff_id, sum(amount) as total
from payment
where customer_id = 1
GROUP BY staff_id;
