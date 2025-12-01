# ibd_pbh
1. Descrição Geral

Este repositório contém o projeto desenvolvido para a disciplina Introdução a Banco de Dados (IBD).
O objetivo é criar, documentar e analisar um banco de dados PostgreSQL utilizando conjuntos de dados abertos da Prefeitura de Belo Horizonte (PBH).

As bases utilizadas incluem informações sobre:

População e domicílios por regional

CadÚnico (pessoas e famílias)

População em situação de rua

Regiões Administrativas de Belo Horizonte

O banco foi criado no PostgreSQL e todas as consultas, scripts e arquivos relevantes estão documentados neste repositório.

2. Softwares Necessários
2.1 PostgreSQL + pgAdmin

Download:
https://www.postgresql.org/download/

Instalar os seguintes componentes:

PostgreSQL Server

pgAdmin

Command Line Tools

StackBuilder

2.2 Instalar PostGIS via StackBuilder

Algumas tabelas utilizam colunas do tipo GEOMETRY, portanto é necessário instalar a extensão PostGIS.

Passos:

Abrir o StackBuilder

Selecionar a instalação do PostgreSQL

Avançar

Em "Spatial Extensions", selecionar PostGIS

Instalar normalmente

Depois de instalado, a extensão precisa ser ativada dentro do banco (passo em seção posterior).

3. Criação do Banco de Dados no pgAdmin
3.1 Criar o banco

Abrir pgAdmin

Clicar em Databases

Create → Database

Nomear como:

ibd


Confirmar

3.2 Ativar PostGIS no banco

Abrir o banco ibd

Menu: Tools → Query Tool

Executar:

CREATE EXTENSION postgis;

4. Criação das Tabelas

As tabelas do projeto são alimentadas por quatro arquivos originais em XLS, disponibilizados pela PBH:

Tabela	Arquivo original
pop_domicilios_regional_2022	20250801_populacao_domicilio_regional_2022.xls
pessoas_cadunico	data_set_pessoas_cadunico.xls
populacao_rua_bh	data_set_poprua_cadunico(1).xls
regiao_administrativa_tb	20220601_regional.xls
4.1 Conversão obrigatória para CSV

Cada arquivo XLS deve ser convertido manualmente:

Abrir no Excel

Arquivo → Salvar como

Selecionar formato CSV (separador: ponto e vírgula)

5. Importação dos Dados nas Tabelas

Existem duas abordagens possíveis.

5.1 Importação pelo pgAdmin (recomendado)

Passo a passo:

No pgAdmin, localizar a tabela criada

Botão direito → Import/Export

Selecionar "Import"

Configurar:

Campo	Valor
Filename	caminho do CSV
Format	CSV
Header	marcado
Delimiter	;
Encoding	UTF8 ou WIN1252 (depende do arquivo)

Confirmar

5.2 Importação via comando COPY

Executado no Query Tool:

COPY nome_da_tabela
FROM 'C:/caminho/do/arquivo.csv'
WITH (
    FORMAT CSV,
    HEADER,
    DELIMITER ';',
    ENCODING 'WIN1252'
);


Caso surja erro de permissão (Windows):

Usar a versão cliente:

\copy nome_da_tabela FROM 'arquivo.csv' CSV HEADER DELIMITER ';'

6. Execução das Consultas

Para executar as consultas SQL produzidas pelo grupo:

Abrir pgAdmin

Tools → Query Tool

Inserir o comando SQL

Executar (ícone triangular)

Os resultados aparecerão na aba inferior da tela.

7. Estrutura Recomendada do Repositório
/csv/                       → Arquivos convertidos para CSV
/scripts/                   → Scripts SQL de criação de tabelas
/consultas/                 → Consultas SQL feitas pelo grupo
/imagens/                   → Prints da operação do banco
README.md                   → Documento principal (este arquivo)
.gitignore                  → Arquivos ignorados pelo Git

8. Como Reproduzir Este Banco de Dados

Instalar PostgreSQL, pgAdmin e PostGIS

Criar o banco ibd

Ativar extensão PostGIS

Criar as tabelas usando os scripts deste repositório

Converter os arquivos XLS para CSV

Importar os dados pelas instruções da Seção 5

Rodar as consultas do diretório /consultas/
