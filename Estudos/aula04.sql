show PROCEDURE status;

show CREATE PROCEDURE endereco_cli;


create procedure listar_clientes6 (in id_cliente int)
    begin
    select customer_id as Id_Cliente, concat(first_name, " ", last_name) as Nome, Email, create_date as Data_de_Criação
    from customer
    where customer_id = id_cliente;
    end;


call listar_clientes6(5);

SELECT *
from customer;

drop procedure listar_cliente;


create procedure listar_cliente(in id_pessoa int) 
begin
declare status_p varchar(40);
declare v_total int;
select count(*) into v_total
from customer
where customer_id = id_pessoa;

if v_total > 0 THEN
set status_p = "Cliente Ativo";
SELECT status_p as Status, customer_id as Id_Cliente, concat(first_name, " ", last_name) as Nome, Email, create_date as Data_de_Criação
from customer
where customer_id = id_pessoa;

else 
set status_p = 'Cliente não encontrado';
select status_p as Status;
end if;
end;

call listar_cliente(3);






show CREATE PROCEDURE listar_cliente;

alter table staff add column comissao decimal(5,2);

update staff set comissao = 0.05
where staff_id = 2;

update staff set comissao = 0.10
where staff_id = 1;

select comissao
from staff
where staff_id = 1;

select payment_id, customer_id, staff_id, (amount * staff.comissao) as Total_Comissao
from payment p
inner join staff = using (staff_id)
WHERE payment.customer_id = 1;
