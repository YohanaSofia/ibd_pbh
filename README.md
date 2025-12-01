# TRABALHO PRÁTICO DE BANCO DE DADOS
##🗂️ Descrição do Projeto

Este repositório contém um banco de dados PostgreSQL criado para o trabalho prático da disciplina Introdução a Banco de Dados (IBD).
O banco foi construído a partir de dados públicos da Prefeitura de Belo Horizonte (PBH), incluindo informações de:

População e domicílios por regional

Pessoas inscritas no CadÚnico

População em situação de rua

Regiões Administrativas de BH

O objetivo é armazenar, limpar e consultar estes dados para análises estatísticas.

##🧰 1. Instalação dos Softwares Necessários
✔️ 1.1 Instalar o PostgreSQL

Baixe o instalador oficial:
👉 https://www.postgresql.org/download/

Durante a instalação, certifique-se de instalar:

PostgreSQL Server

pgAdmin

Command Line Tools

StackBuilder

✔️ 1.2 Instalar a extensão PostGIS (necessária para colunas GEOMETRY)

Algumas tabelas incluem colunas espaciais.
Para usá-las, instale o PostGIS via StackBuilder:

🔧 Como instalar o PostGIS (Passo a passo):

Abra o StackBuilder

Selecione sua instalação do PostgreSQL

Clique em Next

Na lista de ferramentas, encontre:
Spatial Extensions → PostGIS X.X

Marque e clique em Next

Conclua a instalação

Após instalado, você deve ativar a extensão dentro do seu banco com:

CREATE EXTENSION postgis;


Esse comando é rodado dentro do Query Tool do pgAdmin.

##🗄️ 2. Criando o Banco de Dados no pgAdmin
✔️ 2.1 Acessar o pgAdmin

Abra o pgAdmin e conecte-se ao servidor PostgreSQL.

✔️ 2.2 Criar o banco

Clique com botão direito em Databases

Create → Database

Nomeie como:

ibd


Salve

✔️ 2.3 Ativar a extensão PostGIS no banco

Clique no banco ibd

Abra → Tools → Query Tool

Rode:

CREATE EXTENSION postgis;

📑 3. Criando as Tabelas

As tabelas foram construídas a partir de 4 arquivos XLS (um para cada conjunto de dados):

Tabela PostgreSQL	Arquivo de origem (XLS)
pop_domicilios_regional_2022	20250801_populacao_domicilio_regional_2022.xls
pessoas_cadunico	data_set_pessoas_cadunico.xls
populacao_rua_bh	data_set_poprua_cadunico(1).xls
regiao_administrativa_tb	20220601_regional.xls
✔️ 3.1 Antes de importar

Cada XLS deve ser convertido para CSV dentro do Excel:

Arquivo → Salvar como → CSV (Separador: ponto e vírgula)

##🔽 4. Inserindo os Dados nas Tabelas

Existem duas formas:

✔️ Método 1: Pelo pgAdmin (RECOMENDADO)
Passo a passo:

Clique na tabela → Import/Export Data

Selecione Import

Arquivo: selecione seu CSV

Opções importantes:

Campo	Valor
Format	CSV
Header	✔ Ativado
Delimiter	;
Encoding	UTF-8 ou WIN1252 (depende do arquivo)

Clique em OK

→ Os dados serão carregados na tabela.

✔️ Método 2: Usando COPY (linha de comando)

Rodado no Query Tool:

COPY nome_da_tabela
FROM 'C:/caminho/do/arquivo.csv'
WITH (
    FORMAT CSV,
    HEADER,
    DELIMITER ';',
    ENCODING 'WIN1252'
);


Se aparecer erro de permissão:

Use:

\copy nome_da_tabela FROM 'arquivo.csv' CSV HEADER DELIMITER ';'

##📝 5. Rodando as Consultas

Cada integrante do grupo pode subir suas consultas SQL no GitHub dentro da pasta:

/consultas/


No pgAdmin:

Tools → Query Tool

Cole a consulta

Execute com o botão ▶

Se os dados estiverem carregados corretamente, a tabela de resultado aparece abaixo da consulta.

##🌐 6. Publicando o Projeto no GitHub
✔️ Passo a passo:
1. Criar repositório

Acesse GitHub

New Repository

Nome: IBD-PBH

Adicione README

Crie o repositório

2. Subir os arquivos necessários

Dentro da pasta do projeto, envie:

📁 /scripts → arquivos .sql
📁 /csv → arquivos CSV convertidos
📁 /consultas → consultas dos integrantes
📁 /imagens → prints do banco
README.md → este arquivo
.gitignore → evitar Upload de arquivos pesados temporários

3. Commit + push

No GitHub Desktop ou VSCode:

Add → Commit → Push

##🧐 7. Análise Crítica das Fontes de Dados

Deixe este título no README — aqui você coloca sua própria análise.

Sugestões para comentar:

Inconsistência nos nomes das colunas

Arquivos publicados em XLS que precisam ser convertidos

Registros com valores nulos

Dicionários de dados incompletos

Diferenças de codificação (UTF-8, Windows-1252)

Atraso na atualização de alguns datasets

Colunas com preenchimento muito esparso

Falta de padronização entre arquivos (separador, tipo dos dados, etc.)

(Essa parte fica para você editar)

##🏁 Conclusão

Este projeto reúne, organiza e consulta bases de dados públicas da PBH utilizando PostgreSQL e PostGIS.
O repositório permite que qualquer pessoa recrie o banco, carregue os dados e execute as análises feitas pelo grupo.
