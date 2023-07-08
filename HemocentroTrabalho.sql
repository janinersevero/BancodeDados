create schema Trabalho;
use trabalho;

CREATE TABLE Doadores (
  ID INT NOT NULL PRIMARY KEY,
  Nome VARCHAR(500),
  DataNascimento DATE,
  Sexo VARCHAR(100), 
  TipoSanguineo VARCHAR(5) NOT NULL,
  HistoricoMedico VARCHAR(200),
  HemocentroID INT,
  FOREIGN KEY (HemocentroID) REFERENCES Hemocentros(ID)
);

create table Hemocentros (
ID INT not null primary key, 
Nome VARCHAR(500),
Endereço VARCHAR(500),
Cidade VARCHAR(500),
Estado VARCHAR(500)
); 

create table SangueDisponivel (
ID INT not null primary key, 
HemocentroID INT,
TipoSanguineo VARCHAR(5), 
QuantidadeDisponivel INT,
foreign key (HemocentroID) references Hemocentros(ID)
); 

create table Pacientes (
ID INT not null primary key, 
Nome VARCHAR(300) not null,
DataNascimento DATE,
Sexo VARCHAR(100),
TipoSanguineo VARCHAR(5),
HistoricoMedico VARCHAR(200),
QuantidadeDisponivel INT
);

CREATE TABLE Doacoes (
  ID INT NOT NULL PRIMARY KEY,
  DoadorID INT,
  PacienteID INT,
  DataDoacao DATE,
  TotalDoacoes INT,
  FOREIGN KEY (DoadorID) REFERENCES Doadores(ID),
  FOREIGN KEY (PacienteID) REFERENCES Pacientes(ID)
);

-- Inserção de dados na tabela "Doadores"
INSERT INTO Doadores (ID, Nome, DataNascimento, Sexo, TipoSanguineo, HistoricoMedico, HemocentroID)
VALUES (1, 'Júlia Camilly', '2003-07-26', 'Feminino', 'A+', 'Nenhum', 1),
       (2, 'Rebeca Kepler', '2003-11-14', 'Feminino', 'O+', 'Nenhum', 2),
       (3, 'Janiner Severo', '2004-04-29', 'Feminino', 'B+', 'Nenhum', 3),
       (4, 'Ana Carolina', '1995-06-18', 'F', 'AB-', 'Asma', 3);


-- Inserção de dados na tabela "Hemocentros"
INSERT INTO Hemocentros (ID, Nome, Endereço, Cidade, Estado)
VALUES (1, 'Santa Casa de Misericórdia de Porto Alegre', 'Avenida Independência, 75 - bairro Centro Histórico', 'Porto Alegre', 'Rio Grande do Sul'),
       (2, 'Hospital de Clínicas de Porto Alegre', 'Rua São Manoel, 543 - bairro Rio Branco', 'PortoAlegre', 'Rio Grande do Sul'),
       (3, 'Grupo Hospitalar Conceição', 'Avenida Francisco Trein, 596 - bairro Cristo Redentor', 'Porto Alegre', 'Rio Grande do Sul'),
	   (4, 'Hospital São Lucas da PUCRS', 'Avenida Ipiranga, 6690 - bairro Jardim Botânico ', 'Porto Alegre', 'Rio Grande do Sul');
       
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
