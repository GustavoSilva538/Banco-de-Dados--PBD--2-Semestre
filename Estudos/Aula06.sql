create user 'gustavo'@'localhost' IDENTIFIED BY '123456';       ## Cria um novo usuario

grant all PRIVILEGES on estoque.* to 'gustavo'@'localhost';     ## Aqui ele vai falar quais privilegios/permissões a pessoa vai ter e de qaul tabela ela vai ter essas informações

REVOKE select                       ## Ele revoga o SELECT 
on estoque.*                        ## Da tabela ESTOQUE (tem que ter o . e o * no final)
from 'gustavo'@'localhost';         ## e aqui fala quem e onde


CREATE user 'mariana'@'localhost' IDENTIFIED by '123456';

grant all PRIVILEGES on sakila.* to 'mariana'@'localhost';

CREATE user 'dark'@'localhost'IDENTIFIED by 'douobumbum';

grant all PRIVILEGES on sakila.* to 'dark'@'localhost';


