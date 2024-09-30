-- Criação e ativação do banco de dados que iremos usar

CREATE DATABASE db_odontoclin;
use db_odontoclin;

-- Aqui começamos a crriação das tabelas

-- Tabela com os atributos dos pacientes

create table tb_paciente(
paci_id 		tinyint	not null auto_increment,
paci_nome 		varchar(100)	not null,
paci_cpf 		varchar(14) not null,
paci_dtnasc 	date not null,
paci_sexo 		enum ("F", "M"),
paci_email 		varchar(100),
paci_tel 		varchar(13),
paci_cel 		varchar(13),
paci_plano		varchar(100),
paci_alerg		varchar(200),
primary key (paci_id)
)
default charset = utf8mb4;

-- Tabela com os atributos dos dentistas

create table tb_dentista(
dent_id 		tinyint	not null auto_increment,
dent_nome 		varchar(100)	not null,
dent_cpf 		varchar(14) not null,
dent_dtnasc 		date not null,
dent_sexo 		enum ("F", "M"),
dent_email 		varchar(100),
dent_tel 		varchar(13),
dent_cel 		varchar(13),
dent_espec		varchar(100),
primary key (dent_id)
);

-- Tabela com os atributos dos tratamentos

create table tb_tratamento(
trat_id 	tinyint not null auto_increment,
trat_nome	varchar(100) not null,
trat_tipo	varchar(100) not null,
trat_preco	float not null,
primary key (trat_id)
);

-- Tabela com os atributos do prontuário do paciente

create table tb_prontuario(
pron_id		tinyint not null auto_increment,
paci_id		tinyint,
pron_diag	varchar(300),
pron_tratreal	varchar(300),
pron_medicamentos	varchar(300),
pron_obs	varchar(300),
primary key (pron_id),
foreign key (paci_id) references tb_paciente(paci_id)
);

-- Tabela com os atributos dos atendentes

create table tb_atendente(
aten_id 		tinyint	not null auto_increment,
aten_nome 		varchar(100)	not null,
aten_cpf 		varchar(14) not null,
aten_dtnasc 		date not null,
aten_sexo 		enum ("F", "M"),
aten_email 		varchar(100),
aten_tel 		varchar(13),
aten_cel 		varchar(13),
aten_login		varchar(20),
aten_senha		varchar(20),
primary key (aten_id)
);

-- Tabela com os atributos da consulta

create table tb_consulta(
cons_id		tinyint not null auto_increment,
paci_id		tinyint,
dent_id		tinyint,
trat_id		tinyint,
aten_id		tinyint,
cons_data	date,
cons_conc	bool,
primary key(cons_id),
foreign key(paci_id) references tb_paciente(paci_id),
foreign key(dent_id) references tb_dentista(dent_id),
foreign key(trat_id) references tb_tratamento(trat_id),
foreign key(aten_id) references tb_atendente(aten_id)
);

-- Tabela com os atributos dos consultórios

create table tb_consultorio(
cnst_id 	tinyint not null auto_increment,
dent_id		tinyint,	
cnst_equip		varchar(200),
cnst_status 	bool,
primary key(cnst_id),
foreign key(dent_id) references tb_dentista(dent_id)
);

-- AVISO: não execute os DELETEs, usei eles para arrumar e alterar dados anteriores, apenas utilize os INSERTs e os UPDATEs.

-- Aqui inserimos os atendentes na tabela

insert into 
	tb_atendente
    (aten_nome,aten_cpf,aten_dtnasc,aten_sexo,aten_email,aten_tel,aten_cel,aten_login,aten_senha)

values 
	('Bruno Ferreira', '123.456.789-01', '1992-04-10', 'M', 'bruno.ferreira@hotmail.com', '1123456789', '11987654321', 'bferreira', 'senha123'),
    ('Fernanda Almeida', '234.567.890-12', '1988-11-25', 'F', 'fernanda.almeida@gmail.com', '2134567890', '21987654322', 'falmeida', 'senha456'),
    ('Luiz Gustavo Santos', '345.678.901-23', '1995-07-30', 'M', 'luiz.santos@gmail.com', '3135678901', '31987654323', 'lgsantos', 'senha789');
    
update tb_atendente set aten_nome = 'Alessandra Andrade' where aten_id = 2;
update tb_atendente set aten_email = 'alessandraandrade@gmail.com' where aten_id = 2;



select * from tb_atendente;

-- Aqui inserimos os pacientes na tabela

insert into 
	tb_paciente
    (paci_nome,paci_cpf,paci_dtnasc,paci_sexo,paci_email,paci_tel,paci_cel,paci_plano,paci_alerg)
    
values
	( 'João Pedro Silva', '123.456.789-01', '1985-02-15', 'M', 'joao.silva@example.com', '1123456789', '11987654321', 'Plano A', 'Nenhuma'),
    ( 'Maria Clara Oliveira', '234.567.890-12', '1990-07-25', 'F', 'maria.oliveira@example.com', '2134567890', '21987654322', 'Plano B', 'Penicilina'),
    ( 'Roberto Souza', '345.678.901-23', '1978-11-05', 'M', 'roberto.souza@example.com', '3135678901', '31987654323', 'Plano C', 'Lactose'),
    ( 'Ana Paula Costa', '456.789.012-34', '1989-03-19', 'F', 'ana.costa@example.com', '4136789012', '41987654324', 'Plano D', 'Glúten');
    


select * from tb_paciente;

-- Aqui inserimos os dentistas na tabela 

insert into
	tb_dentista
    (dent_nome,dent_cpf,dent_dtnasc,dent_sexo,dent_email,dent_tel,dent_cel,dent_espec)
    
values
	( 'Carlos Henrique Silva', '234.567.890-11', '1978-09-23', 'M', 'carlos.silva@example.com', '2134567890', '21987654322', 'Endodontia'),
    ( 'Mariana Oliveira', '345.678.901-22', '1990-03-11', 'F', 'mariana.oliveira@example.com', '3135678901', '31987654323', 'Periodontia');
    
select * from tb_dentista;
    
update tb_dentista set dent_cpf = '234.567.890-12' where dent_id = 1;
update tb_dentista set dent_tel = '2134547490' where dent_id = 1;
    
delete from tb_dentista where dent_id = 2;

-- Aqui inserimos os tratamentos na tabela

insert into
	tb_tratamento
    (trat_nome,trat_tipo,trat_preco)
    
values
	
    ( 'Canal Radicular', 'Endodontia', 800.00),
    ( 'Tratamento Periodontal', 'Periodontia', 600.00),
    ( 'Clareamento Dental', 'Cosmético', 1000.00),
    ( 'Implante Dentário', 'Cirurgia', 2500.00),
    ( 'Restauração Dental', 'Conservador', 300.00),
    ( 'Extração de Siso', 'Cirurgia', 700.00),
    ( 'Limpeza Dental', 'Preventivo', 200.00),
    ( 'Aplicação de Flúor', 'Preventivo', 150.00),
    ( 'Ortodontia', 'Correção', 3500.00),
    ( 'Lente de Contato Dental', 'Cosmético', 4000.00),
    ( 'Tratamento de Cárie', 'Conservador', 250.00),
    ( 'Placa de Mordida', 'Correção', 800.00),
    ( 'Retração Gengival', 'Periodontia', 900.00),
    ( 'Enxerto Ósseo', 'Cirurgia', 3000.00),
    ( 'Consultoria Estética', 'Cosmético', 500.00);

-- Aqui inserimos os registros de consulta na tabela

insert into
	tb_consulta
    (cons_id, paci_id,dent_id,trat_id,aten_id,cons_data,cons_conc)
    
values
    
    (1, 2, 1, 1, 1, '2024-01-10', TRUE),
    (2, 3, 2, 2, 1, '2024-01-12', FALSE),
    (3, 2, 1, 3, 2, '2024-01-15', TRUE),
    (4, 1, 2, 4, 2, '2024-01-17', FALSE),
    (5, 4, 1, 5, 2, '2024-01-20', TRUE);
    
select * from tb_consulta;

-- Aqui inserimos as informações dos consultórios na tabela 

insert into
	tb_consultorio
    (dent_id,cnst_equip,cnst_status)
    
values
	( 1, 'Cadeira odontológica, Equipamento de Raio-X, Kit de Instrumentos', TRUE),
    ( 2, 'Cadeira odontológica, Autoclave, Compressor de Ar', FALSE);
    
select * from tb_consultorio;

-- Aqui inserimos as informações do prontuário dos pacientes na tabela

insert into
	tb_prontuario
    (paci_id,pron_diag,pron_tratreal,pron_medicamentos,pron_obs)

values
	( 1, 'Cárie dentária', 'Restauração', 'Anestésico, Amoxicilina', 'Paciente colaborou bem durante o tratamento.'),
    ( 2, 'Gengivite', 'Limpeza profunda', 'Clorexidina, Ibuprofeno', 'Recomendado usar fio dental diariamente.'),
    ( 3, 'Sensibilidade dental', 'Aplicação de flúor', 'Sensodyne, Ibuprofeno', 'Agendar retorno em 6 meses.'),
    ( 4, 'Bruxismo', 'Placa de mordida', 'Diazepam, Relaxante muscular', 'Paciente relatou melhora após uso da placa.');
    
select * from tb_prontuario;
	

    
update tb_tratamento set trat_preco = '3000.00' where trat_id = 4;

select * from tb_tratamento;

select paci_sexo, count(*) as Total_por_genero from tb_paciente group by paci_sexo;

select paci_nome, paci_sexo from tb_paciente order by paci_sexo;

select trat_tipo, avg(trat_preco) as Preço_medio from tb_tratamento group by trat_tipo order by trat_tipo;

select trat_nome, trat_preco as Procedimentos_complexos from tb_tratamento group by trat_id having(trat_preco) > 1000;

select trat_nome, trat_preco as Procedimentos_simples from tb_tratamento group by trat_id having(trat_preco) <= 1000;

select max(trat_preco) as "Maior preço" from tb_tratamento;

select distinct trat_tipo as Tipos_de_tratamento from tb_tratamento  order by trat_tipo;

select trat_nome as "Nome do Tratamento", trat_preco as "Preço do tratamento" from tb_tratamento order by trat_preco desc;

select trat_nome as "Nome do Tratamento", trat_preco as "Preço do tratamento" from tb_tratamento order by trat_preco asc;

select min(trat_preco) as "Menor preço" from tb_tratamento;

create view vw_preco as
(select trat_tipo, avg(trat_preco) as Preço_medio from tb_tratamento group by trat_tipo order by trat_tipo
);

select * from vw_preco;

select paci_nome, paci_alerg, paci_cpf from tb_paciente;

create view vw_alergias as
(select paci_nome, paci_alerg, paci_cpf from tb_paciente
);

select * from vw_alergias;

select c.cons_id,
 c.cons_data as "Data da Consulta",
 c.trat_id, 
 t.trat_nome as "Nome do tratamento",
 t.trat_tipo as "Tipo de tratamento",
 t.trat_preco as "Preço do tratamento",
 c.dent_id,
 d.dent_nome as "Nome do dentista"
from tb_consulta c inner join tb_tratamento t
on c.trat_id = t.trat_id
inner join tb_dentista d 
on d.dent_id = c.dent_id
order by c.cons_id
;

CREATE VIEW vw_registro_de_consultas AS
SELECT 
    c.cons_id,
    c.cons_data AS "Data da Consulta",
    c.trat_id, 
    t.trat_nome AS "Nome do Tratamento",
    t.trat_tipo AS "Tipo de Tratamento",
    t.trat_preco AS "Preço do Tratamento",
    c.dent_id,
    d.dent_nome AS "Nome do Dentista"
FROM 
    tb_consulta c
    INNER JOIN tb_tratamento t ON c.trat_id = t.trat_id
    INNER JOIN tb_dentista d ON c.dent_id = d.dent_id
ORDER BY 
    c.cons_id;

-- Criar uma consulta com subquery para combinar dados de tb_consulta, tb_tratamento e tb_dentista
SELECT 
    c.cons_id,
    c.cons_data AS "Data da Consulta",
    c.trat_id,
    (SELECT trat_nome FROM tb_tratamento WHERE trat_id = c.trat_id) AS "Nome do Tratamento",
    (SELECT trat_tipo FROM tb_tratamento WHERE trat_id = c.trat_id) AS "Tipo de Tratamento",
    (SELECT trat_preco FROM tb_tratamento WHERE trat_id = c.trat_id) AS "Preço do Tratamento",
    c.dent_id,
    (SELECT dent_nome FROM tb_dentista WHERE dent_id = c.dent_id) AS "Nome do Dentista"
FROM 
    tb_consulta c
ORDER BY 
    c.cons_id;