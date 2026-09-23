select * from film;
create view vw_filmes as 
select 
film.film_id as 'Código',
film.title as 'Titulo',
film.description as 'Descrição',
film.release_year as 'Ano de lançamento',
film.rating as 'Classificação indicativa',
film_category.category_id as 'Categoria_ID'
from film
inner join film_category on film_category.film_id = film.film_id;

select * from address;

create view vw_clientes AS
select
CONCAT(customer.first_name, ' ', customer.last_name) as 'Nome',
customer.email as 'E-mail',
address.address as 'Endereço',
address.district as 'País'
from customer
inner join address on address.address_id = customer.address_id;
