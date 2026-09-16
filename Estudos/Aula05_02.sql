create table venda (
    cod_venda int primary key AUTO_INCREMENT,
    nome_cli varchar(50) not null,
    cod_prod int,
    qtd_venda int
);


create Table produto (
    cod_prod int PRIMARY key AUTO_INCREMENT,
    nome_prod varchar(50) not null,
    preco_prod decimal(10,2) not null,
    qtd_estoque int not null        
);


insert into produto (nome_prod, preco_prod, qtd_estoque) values
('Camiseta', 29.90, 100),
('Calça Jeans', 79.90, 50),
('Tênis', 149.90, 30),
('Jaqueta', 199.90, 20),
('Boné', 19.90, 200);

show triggers;

CREATE TRIGGER baixa_estoque after insert ON venda FOR EACH ROW
begin
    update produto set qtd_estoque = qtd_estoque - new.qtd_venda where cod_prod = NEW.cod_prod;
END;


insert into venda(nome_cli, cod_prod, qtd_venda) values
('João' ,1, 2);

select * from produto;

create trigger valida_produto before insert on venda for each ROW
begin
    declare valor_qtd_estoque int;
    declare mensagem varchar(100);
    select qtd_estoque into valor_qtd_estoque from produto WHERE cod_prod = new.cod_prod;
    IF new.qtd_venda > valor_qtd_estoque THEN
        set mensagem = 'Qantidade de vendas maior que estoque';
        SIGNAL SQLSTATE '45000' set MESSAGE_TEXT = mensagem;
    end if;
end;


insert into venda (nome_cli, cod_prod, qtd_venda) values
('Jonas', 2, 60)


create trigger estorno_estoque before delete on venda for each row 
begin
    update produto set qtd_estoque = qtd_estoque + old.qtd_venda where cod_prod = old.cod_prod;
end;

select * from venda;

select * from produto;

DELETE from venda where cod_venda = 1;


