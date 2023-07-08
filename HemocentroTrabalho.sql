create schema Trabalho;
use trabalho;

-- Criação Tabela de Doadores
CREATE TABLE Doadores (
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

-- Criação Tabela de Hemocentros
create table Hemocentros (
	ID_Hemocentro INT not null primary key, 
	Nome VARCHAR(100),
	Endereço VARCHAR(100),
	Cidade VARCHAR(100),
	Estado CHAR(2)
); 

-- Criação de Tabela de Quantidade de Sangue Disponível
create table SangueDisponivel (
	ID_Sangue INT not null primary key,
	ID_Doador INT not null,
	ID_Hemocentro INT,
	TipoSanguineo VARCHAR(5), 
	QuantidadeDisponivel INT,
	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
); 

--  Criação de Tabela de Pacientes
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

-- Criação de Tabela de Doações
CREATE TABLE Doacoes (
	ID_Doacao INT not null primary key,
	ID_Doador INT,
	ID_Paciente INT,
   	ID_Hemocentro INT,
	DataDoacao DATE,
	TotalDoacoes INT,
	foreign key (ID_Doador) references Doadores(ID_Doador),
	foreign key (ID_Paciente) references Pacientes(ID_Paciente),
    	foreign key (ID_Hemocentro) references Hemocentros(ID_Hemocentro)
);

-- Inserção de dados na tabela "Hemocentros"
INSERT INTO Hemocentros (ID, Nome, Endereço, Cidade, Estado)
VALUES (1, 'Santa Casa de Misericórdia de Porto Alegre', 'Avenida Independência, 75 - bairro Centro Histórico', 'Porto Alegre', 'Rio Grande do Sul'),
       (2, 'Hospital de Clínicas de Porto Alegre', 'Rua São Manoel, 543 - bairro Rio Branco', 'PortoAlegre', 'Rio Grande do Sul'),
       (3, 'Grupo Hospitalar Conceição', 'Avenida Francisco Trein, 596 - bairro Cristo Redentor', 'Porto Alegre', 'Rio Grande do Sul'),
	   (4, 'Hospital São Lucas da PUCRS', 'Avenida Ipiranga, 6690 - bairro Jardim Botânico ', 'Porto Alegre', 'Rio Grande do Sul');

-- Inserção de dados na tabela "Doadores"
INSERT INTO Doadores (ID, Nome, DataNascimento, Sexo, TipoSanguineo, HistoricoMedico, HemocentroID)
VALUES (1, 'Júlia Camilly', '2003-07-26', 'Feminino', 'A+', 'Nenhum', 1),
       (2, 'Rebeca Kepler', '2003-11-14', 'Feminino', 'O+', 'Nenhum', 2),
       (3, 'Janiner Severo', '2004-04-29', 'Feminino', 'B+', 'Nenhum', 3),
       (4, 'Ana Carolina', '1995-06-18', 'F', 'AB-', 'Asma', 3);
       
-- Inserção de dados na tabela "SangueDisponivel"
INSERT INTO SangueDisponivel (ID, HemocentroID, TipoSanguineo, QuantidadeDisponivel)
VALUES (1, 1, 'A+', 10),
       (2, 1, 'O-', 5),
       (3, 2, 'AB+', 7),
       (4, 3, 'B-', 3);	
       
-- Inserção de dados na tabela "Pacientes"
INSERT INTO Pacientes (ID, Nome, DataNascimento, Sexo, TipoSanguineo, HistoricoMedico)
VALUES (1, 'José Silva', '1970-02-15', 'Masculino', 'A+', 'Diabetes'),
       (2, 'Carla Ferreira', '1988-12-02', 'Feminino', 'O-', 'Nenhum'),
       (3, 'André Martins', '1992-07-21', 'Masculino', 'AB+', 'Anemia'),
       (4, 'Laura Cardoso', '1985-09-08', 'Feminino', 'B-', 'Nenhum');
       
-- Inserção de dados na tabela "Doacoes"
INSERT INTO Doacoes (ID, DoadorID, PacienteID, DataDoacao, TotalDoacoes)
VALUES (1, 1, 3, '2023-01-15', 2),
       (2, 2, 1, '2023-02-28', 1),
       (3, 4, 2, '2023-03-10', 3),
       (4, 3, 4, '2023-04-05', 2);
       
-- Consulta a Quantidade de Sangue Disponíveis nos Hemocentros
SELECT Hemocentros.Nome, SUM(SangueDisponivel.QuantidadeDisponivel) AS TotalDisponivel
FROM Hemocentros
JOIN SangueDisponivel ON Hemocentros.ID_Hemocentro = SangueDisponivel.ID_Hemocentro
GROUP BY Hemocentros.Nome;

-- Consulta mostra a quantidade de doações feita por cada Doador
SELECT Doadores.Nome, COUNT(Doacoes.ID_Doacao) AS TotalDoacoes
FROM Doadores
JOIN Doacoes ON Doadores.ID_Doador = Doacoes.ID_Doador
GROUP BY Doadores.Nome;

-- Consulta mostra onde os doadores realizaram as doações
SELECT Doadores.Nome, Hemocentros.Nome AS NomeHemocentro
FROM Doadores
JOIN Hemocentros ON Doadores.ID_Hemocentro = Hemocentros.ID_Hemocentro;

-- Consulta de doadores que doaram para pacientes com o mesmo tipo sanguíneo
SELECT D.Nome AS NomeDoador, P.Nome AS NomePaciente
FROM Doadores D
JOIN Doacoes ON D.ID_Doador = Doacoes.ID_Doador
JOIN Pacientes P ON Doacoes.ID_Paciente = P.ID_Paciente
WHERE D.TipoSanguineo IN (
    SELECT TipoSanguineo
    FROM Pacientes
    WHERE ID_Paciente = Doacoes.ID_Paciente
)

-- Consulta mostra onde os doares realizaram as doações 
SELECT Doadores.Nome, Hemocentros.Nome AS NomeHemocentro
FROM Doadores
JOIN Hemocentros ON Doadores.HemocentroID = Hemocentros.ID;
