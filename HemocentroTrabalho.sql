create schema Trabalho;
use trabalho;

create table Hemocentros (
	ID_Hemocentro INT not null primary key, 
	Nome VARCHAR(100),
	Endereço VARCHAR(100),
	Cidade VARCHAR(100),
	Estado CHAR(2)
); 

create table Doadores (
	ID_Doador INT not null primary key,
	Nome VARCHAR(100) not null,
	CPF CHAR(11) not null,
	DataNascimento DATE,
	Sexo CHAR(1), 
	TipoSanguineo VARCHAR(3) not null,
	HistoricoMedico VARCHAR(100),
	ID_Hemocentro INT,
	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
);

create table SangueDisponivel (
	ID_Sangue INT not null primary key,
	ID_Doador INT not null,
	ID_Hemocentro INT,
	TipoSanguineo VARCHAR(5), 
	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
); 

create table Pacientes (
	ID_Paciente INT not null primary key,
	Nome VARCHAR(100) not null,
	CPF CHAR(11) not null,
	DataNascimento DATE,
	Sexo CHAR(1), 
	TipoSanguineo VARCHAR(3) not null,
	HistoricoMedico VARCHAR(100),
	ID_Hemocentro INT,
	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
);

create table Doacoes (
	ID_Doacao INT not null primary key,
	ID_Doador INT,
	ID_Paciente INT,
	ID_Hemocentro INT,
	DataDoacao DATE,
	DataRecepcao DATE,
	foreign key (ID_Doador) references Doadores(ID_Doador),
	foreign key (ID_Paciente) references Pacientes(ID_Paciente),
	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
);
-- Inserção de dados na tabela "Hemocentros"
insert into Hemocentros (ID_Hemocentro, Nome, Endereço, Cidade, Estado)
values (1, 'Santa Casa de Misericórdia de Porto Alegre', 'Avenida Independência, 75 - Centro Histórico', 'Porto Alegre', 'RS'),
       (2, 'Hospital de Clínicas de Porto Alegre', 'Rua São Manoel, 543 - Rio Branco', 'PortoAlegre', 'RS'),
       (3, 'Grupo Hospitalar Conceição', 'Avenida Francisco Trein, 596 - Cristo Redentor', 'Porto Alegre', 'RS'),
	   (4, 'Hospital São Lucas da PUCRS', 'Avenida Ipiranga, 6690 - Jardim Botânico ', 'Porto Alegre', 'RS'),
       (5, 'Centro de Hematologia e Hemoterapia de Santa Catarina', 'Avenida Prof. Othon Gama D’Eça, 756 – Centro', 'Florianópolis', 'SC'),
       (6, 'Centro de Hematologia e Hemoterapia do Paraná', 'Travessa João Prosdócimo, 145 - Alto da XV', 'Curitiba', 'PR');
       
-- Inserção de dados na tabela "Doadores"
insert into Doadores (ID_Doador, Nome, CPF, DataNascimento, Sexo, TipoSanguineo, HistoricoMedico, ID_Hemocentro)
values (0001, 'Júlia Camilly Flach', '03371764001', '2003-07-26', 'F', 'A+', null, 1),
       (0002, 'Rebeca Kepler', '78263217008', '2003-11-14', 'F', 'O+', null, 2),
       (0003, 'Janiner Severo', '93365717021', '2004-04-29', 'F', 'B+', null, 3),
       (0004, 'Maria Antônia Maia', '35330901081', '2002-09-04', 'F', 'O+', 'Asma', 4),
       (0005, 'Pedro Luís Flach', '53218960037', '1995-06-18', 'M', 'AB-', 'Hipertensão', 1),
       (0006, 'Julieta Cunha Fernandes', '16591451471', '1994-11-14', 'F', 'O-', 'Labirintite', 6),
       (0007, 'Kauã Cunha Sousa', '16861393576', '1967-11-06', 'M', 'O+', null, 2),
       (0008, 'Eduardo Silva Ribeiro', '38124138095', '1974-12-27', 'M', 'B-', 'Tabagismo', 2),
       (0009, 'Breno Souza Gomes', '70408395044', '1985-04-15', 'M', 'AB+', null, 4),
       (0010, 'Tomás Melo Sousa', '52136329391', '1968-06-03', 'M', 'A-', 'Depressão', 5); 
       
-- Inserção de dados na tabela "SangueDisponivel"
insert into SangueDisponivel (ID_Sangue, ID_Doador, TipoSanguineo, ID_Hemocentro)
values (0101, 0001, 'A+', 1),
       (0201, 0002, 'O+', 2),
       (0301, 0003, 'B+', 3),
       (0401, 0004, 'O+', 4),
       (0102, 0005, 'AB-', 1),
       (0601, 0006, 'O-', 6),
       (0202, 0007, 'O+', 2),
       (0203, 0008, 'B-', 2),
       (0402, 0009, 'AB+', 4),
       (0501, 0010, 'A-', 5);
       
-- Inserção de dados na tabela "Pacientes"
insert into Pacientes (ID_Paciente, Nome, CPF, DataNascimento, Sexo, TipoSanguineo, HistoricoMedico, ID_Hemocentro)
values (0001, 'José Silva', '67134695077', '1970-02-15', 'M', 'A+', 'Diabetes', 5),
       (0002, 'Carla Ferreira', '19983742039', '1988-12-02', 'F', 'O-', null, 6),
       (0003, 'André Martins', '52817403002', '1992-07-21', 'M', 'AB+', 'Anemia', 4),
       (0004, 'Laura Cardoso', '71538822008',  '1985-09-08', 'F', 'B-', null, 2),
       (0005, 'Janete Assunção', '67845298000', '1990-04-18', 'F', 'O-', 'Tabagismo', 6);
       
-- Inserção de dados na tabela "Doacoes"
insert into Doacoes (ID_Doacao, ID_Doador, ID_Paciente, DataDoacao, DataRecepcao)
values (0150, 0010, 0001, '2023-01-15', '2023-01-19'),
       (0151, 0006, 0002, '2023-02-28', '2023-03-03'),
       (0152, 0004, 0003, '2023-03-10', '2023-03-14'),
       (0153, 0008, 0004, '2023-04-05', '2023-04-09'),
       (0154, 0006, 0005, '2023-06-24', '2023-06-28'); 
       
/*--------------------------CONSULTAS--------------------------*/
-- 1. Consulta com junção:
-- Consulta que imprime a quantidade total de sangue disponível nos hemocentros do RS.
select count(S.ID_Sangue) as Quantidade_total_sangue_RS
from sanguedisponivel S
inner join hemocentros H on S.ID_Hemocentro = H.ID_Hemocentro
where H.Estado = 'RS';

-- 2. Consulta com junção e com função agregada:
-- Consulta que mostra a quantidade total de doações de cada doador, 
-- ordenando o resultado por ordem alfabética.
select D.Nome, count(DOE.ID_Doacao) as TotalDoacoes
from Doadores D
inner join Doacoes DOE on D.ID_Doador = DOE.ID_Doador
group by D.nome
order by 1 asc;

-- 3. Consulta com junção e com função agregada:
-- Faça uma consulta que imprima a quantidade de doadores O+ registrados
-- nos hemocentros da região sul do país. Ordene pela ordem alfabética do estado.
select count(D.TipoSanguineo) as Total_O_Positivo, H.Estado
from Doadores D
inner join Hemocentros H on D.ID_Hemocentro = H.ID_Hemocentro
where D.TipoSanguineo = 'O+' and (H.Estado = 'RS' or H.Estado = 'SC' or H.Estado = 'PR')
group by H.Estado
order by 2 asc; /*botar mais dados nos hemocentros, 1 com O+ em SC/PR e um hemocentro de outra região*/

-- 4. Consulta com subconsulta.
-- Consulta que mostra o nome dos doadores que doaram para pacientes com o mesmo tipo sanguíneo.
select distinct D.Nome as Nome_Doador
from Doadores D
inner join Doacoes on D.ID_Doador = Doacoes.ID_Doador
inner join Pacientes P on Doacoes.ID_Paciente = P.ID_Paciente
where D.TipoSanguineo in (
    select TipoSanguineo
    from Pacientes
    where ID_Paciente = Doacoes.ID_Paciente
);

-- 5. Consulta de livre escolha.
-- Consulta que mostra o nome dos doadores, o nome e o estado do hemocentro em que estão cadastrados.
-- Ordenada pelo nome do hemocentro e pelo nome do doador, respectivamente.
select D.Nome, H.Nome as Nome_Hemocentro, H.Estado
from Doadores D
inner join Hemocentros H on D.ID_Hemocentro = H.ID_Hemocentro
order by 2, 1;
