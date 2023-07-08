create schema Trabalho;
use trabalho;

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

create table Hemocentros (
	ID_Hemocentro INT not null primary key, 
	Nome VARCHAR(100),
	Endereço VARCHAR(100),
	Cidade VARCHAR(100),
	Estado CHAR(2)
); 

create table SangueDisponivel (
	ID_Sangue INT not null primary key,
	ID_Doador INT not null,
	ID_Hemocentro INT,
	TipoSanguineo VARCHAR(5), 
	QuantidadeDisponivel INT,
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
