create function nome_comp(id int)
returns char(50)
deterministic
begin
declare nome char(50);
select concat(first_name, ' ',last_name) into nome
from customer
where customer_id = 2;
RETURN nome;
END;
