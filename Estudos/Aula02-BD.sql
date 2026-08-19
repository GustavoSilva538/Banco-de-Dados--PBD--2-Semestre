select *
from actor;

select actor_id as 'Codigo',
concat (first_name, ' ', last_name) as 'Nome'
from actor
ORDER BY nome;

CREATE View ator_nomes as 
    select actor_id as 'Codigo',
    concat (first_name, ' ', last_name) as 'Nome'
    from actor
    ORDER BY nome;

    select *
    from ator_nomes;

    create table copia_atores as 
    select actor_id as 'Codigo',
    concat (first_name, ' ', last_name) as 'Nome'
    from actor
    ORDER BY nome;

    select *
    from copia_atores;

    update actor set first_name = 'ADAM 2'
    where actor_id = 71;

    describe actor;

    select * 
    from actor;

    select *
    from copia_atores 
    where codigo = 71;

-- Gere uma view com o códigom nome do cliente e endereço completo--

select * 
from customer;

create view customer_13 as
select customer_id as 'Codigo',
CONCAT (first_name, ' ', last_name) as 'Nome',
address.address,
city.city
from customer
inner join address on address.address_id = customer.address_id
inner join city on city.city_id = address.city_id;

    
select *
from customer
inner join address using(address_id)
inner join city using(city_id)
inner join country using(country_id);


create view customers_5 as
select customer.customer_id as 'Codigo',
CONCAT(customer.first_name, ' ', customer.last_name) as 'Nome',
address.postal_code as 'Codigo Postal',
address.address as 'Endereço',
address.district as 'Estado',
address.location as 'Localização Geometrica',
city.city as 'Cidade',
country.country as 'Pais'
from customer
inner join address on customer.address_id = address.address_id
inner join city on address.city_id = city.city_id
inner join country on city.country_id = country.country_id
order by nome;
