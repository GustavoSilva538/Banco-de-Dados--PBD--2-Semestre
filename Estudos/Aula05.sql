show triggers;

select * from actor;

select * from actor where actor_id = 1;

create table aud_actor as select * from actor;

select * from aud_actor;

truncate table aud_actor;

alter table aud_actor add COLUMN usuario varchar(10);

alter table aud_actor add COLUMN data_da_alteracao date;

create trigger monitora_actor after update on actor for each row 
begin
    insert into aud_actor (actor_id, first_name, last_name, last_update, usuario, data_da_alteracao)
    VALUES (old.actor_id, old.first_name, old.last_name, old.last_update, 'Romulo', now());
end;

SELECT * from aud_actor;

select * from actor;

UPDATE actor set first_name = 'Roberto' WHERE actor_id = 2;
