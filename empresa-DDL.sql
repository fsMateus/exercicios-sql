CREATE SCHEMA EMPRESA;

CREATE TABLE DEPARTAMENTO
(
    Dnome VARCHAR(20) NOT NULL,
    Dnumero INT NOT NULL,
    Cpf_gerente VARCHAR(11),
    Data_inicio_gerente DATE,
    PRIMARY KEY(Dnumero),
    UNIQUE(Dnome)
);

CREATE TABLE LOCALIZACOES_DEP
(
    Dnumero INT NOT NULL,
    Dlocal VARCHAR(20) NOT NULL,    
    PRIMARY KEY(Dnumero, Dlocal),
    FOREIGN KEY(Dnumero) REFERENCES DEPARTAMENTO(Dnumero)
);

CREATE TABLE FUNCIONARIO
(
    Pnome VARCHAR(20) NOT NULL,
    Minicial CHAR,
    Unome VARCHAR(20) NOT NULL,
    Cpf VARCHAR(11) NOT NULL,
    Datanasc DATE,
    Endereco VARCHAR(40),
    Sexo CHAR NOT NULL,
    Salario DECIMAL(7,2) NOT NULL,
    Cpf_supervisor VARCHAR(11),
    Dnr INT,
    PRIMARY KEY(Cpf),
    FOREIGN KEY(Cpf_supervisor) REFERENCES FUNCIONARIO(Cpf),
    FOREIGN KEY(Dnr) REFERENCES DEPARTAMENTO(Dnumero)
);

ALTER TABLE DEPARTAMENTO
ADD FOREIGN KEY(Cpf_gerente) REFERENCES FUNCIONARIO(Cpf);

CREATE TABLE DEPENDENTE
(
    Fcpf VARCHAR(11) NOT NULL,
    Nome_dependente VARCHAR(20) NOT NULL,
    Sexo CHAR,
    Datanasc DATE,
    Parentesco VARCHAR(20),
    PRIMARY KEY(Fcpf, Nome_dependente),
    FOREIGN KEY(Fcpf) REFERENCES FUNCIONARIO(Cpf)
);

CREATE TABLE PROJETO
(
    Projnome VARCHAR(20) NOT NULL,
    Projnumero INT NOT NULL,
    Projlocal VARCHAR(20),
    Dnum INT,
    PRIMARY KEY(Projnumero),
    FOREIGN KEY(Dnum) REFERENCES DEPARTAMENTO(Dnumero)
);

CREATE TABLE TRABALHA_EM
(
    Fcpf VARCHAR(11) NOT NULL,
    Pnr INT NOT NULL,
    Horas TIME,
    PRIMARY KEY(Fcpf, Pnr),
    FOREIGN KEY(Pnr) REFERENCES PROJETO(Projnumero)
);