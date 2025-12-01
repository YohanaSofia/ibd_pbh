# TRABALHO PRÁTICO DE BANCO DE DADOS
## 🗂️ Descrição do Projeto

Este repositório contém um banco de dados PostgreSQL criado para o trabalho prático da disciplina Introdução a Banco de Dados (IBD).
O banco foi construído a partir de dados públicos da Prefeitura de Belo Horizonte (PBH), incluindo informações de:

* 06/2022 - POPULAÇÃO RUA NO CADASTRO ÚNICO
(https://dados.pbh.gov.br/dataset/populacao-de-rua/resource/27476597-54ab-4961-9d6b-f8e6a9527c5c)

* 06/2022 - PESSOAS NO CADASTRO ÚNICO
(https://dados.pbh.gov.br/dataset/pessoas-no-cadastro-unico/resource/28b6f308-57be-48e6-b63b-778b4151a54b)

* Região Administrativa (Regional)
(https://dados.pbh.gov.br/dataset/regiao-administrativa)

* 20250801_populacao_domicilio_regional_2022.csv
(https://dados.pbh.gov.br/dataset/populacao-por-regional-2022/resource/fcc1c14e-b81e-4d1b-8b0e-966c5fe50740) 

O objetivo é armazenar, limpar e consultar estes dados para análises estatísticas.

## 🧰 1. Instalação dos Softwares Necessários
### ✔️ 1.1 Instalar o PostgreSQL

Baixe o instalador oficial:
👉 https://www.postgresql.org/download/

Durante a instalação, certifique-se de instalar:

*PostgreSQL Server: os arquivos abaixos veem junto com essa instalação e são necessário para o bom funcionamento do sistema:

** pgAdmin

** Command Line Tools

** StackBuilder

### ✔️ 1.2 Instalar a extensão PostGIS (necessária para colunas GEOMETRY)

Algumas tabelas incluem colunas espaciais. Para usá-las, instale o PostGIS via StackBuilder:

* Abra o StackBuilder

* (Selecione sua instalação do PostgreSQL

* (Clique em Next)

* Na lista de ferramentas, encontre: Spatial Extensions → PostGIS X.X

* Marque e clique em Next

Após instalado, você deve ativar a extensão dentro do seu banco com:
```bash
CREATE EXTENSION postgis;
````

Esse comando é rodado dentro do Query Tool do pgAdmin.

## 🗄️ 2. Criando o Banco de Dados no pgAdmin
### ✔️ 2.1 Acessar o pgAdmin

Abra o pgAdmin e conecte-se ao servidor PostgreSQL.

### ✔️ 2.2 Criar o banco

Clique com botão direito em Databases

* Create → Database

Nomeie como: ibd  e depois salve.

### ✔️ 2.3 Ativar a extensão PostGIS no banco

Clique no banco ibd

Abra → Tools → Query Tool

Rode:

```Bash
CREATE EXTENSION postgis;
````
Vale ressaltar que o PostGis é importante pois há dados na tabela que só serão reconhecidos após a instalação dessa extensão.

## 📑 3. Criando as Tabelas

As tabelas foram construídas a partir de 4 arquivos CSVs (um para cada conjunto de dados):

* Tabela PostgreSQL	Arquivo de origem (CSV)
* pop_domicilios_regional_2022	20250801_populacao_domicilio_regional_2022.csv
* pessoas_cadunico	data_set_pessoas_cadunico.csv
* populacao_rua_bh	data_set_poprua_cadunico(1).csv
* regiao_administrativa_tb	20220601_regional.csv

Portanto, para que as consultas possam ser executadas com sucesso é preciso importar essas tabelas no pgadmin. 

## 🔽 4. Inserindo os Dados nas Tabelas

### ✔️ Importação dos dados no PgAdmin

Para importar essas tabelas no pgadmin será preciso ir até a tabela de referencia, e:

* na tabela → Import/Export Data

* Selecione Import

* Arquivo: selecione seu CSV

**Obs: esse dados da PBH não seguem o padrão da importação do pgadmin o mais importante a ser feito é identificada o delimitador desse arquivos como ; e não ,**

Opções importantes:

*Campo	Valor
*Format	CSV
*Header	✔ Ativado
*Delimiter	;
*Encoding	UTF-8 ou WIN1252 (depende do arquivo)

Após esse detalhes, estará tudo certo e os dados serão inseridos nas tabelas

## 📝 5. Rodando as Consultas

As consultas realizadas nesse trabalhos encontram-se na pasta:

/consultas/


Para roda-las no pgadmin é preciso ir em:

* Tools → Query Tool

* Cole a consulta

* Execute com o botão ▶

Se os dados estiverem carregados corretamente, a tabela de resultado aparece abaixo da consulta.

## 🌐 6. Estrutura de pastas

* 📁 /consultas → arquivos de consultas realizadas no banco
* 📁 /creates → arquivos para gerar as tabelas
* README.md → este arquivo

Os arquivos .csv usando como base de dados, estão disponilizados no link da primeiro tópico, eles podem ser baixados direto do site da prefeitura. 

## 🧐 7. Análise Crítica das Fontes de Dados

As bases de dados utilizadas no projeto foram obtidas a partir do Portal de Dados Abertos da Prefeitura de Belo Horizonte (PBH), incluindo os datasets do Cadastro Único (CadÚnico), População em Situação de Rua (PopRua) e População e Domicílios por Região Administrativa. Apesar de oficialmente disponibilizadas, as fontes apresentaram diversas limitações que impactaram a etapa de modelagem e análise.

Tabelas relacionadas a características socioeconômicas apresentaram poucas quantidade de valores ausentes, os casos giram em torno da tabela possoa e domicilio por região e pessoas no cadastro unico, specialmente no atributo remuneração_mes_passado. O que prejudica análises estatísticas mais completas.

Apesar de os dados serem públicos, muitos arquivos estavam desatualizados, desativados ou distribuídos por anos distintos, sem indicação clara da periodicidade. A maioria dos dicionários de dados possuíam o mínimo de informações, muitas coisas poderiam ser observadas ao ver a tabela. Além disso, a forma como os dados são apresentados ao público, não contribuem para o entendimento  sobre aquela base, não descrição e a maioria é apresentada como “text”, mesmo não sendo um texto. Mas os dados que envolvem coletas mensais não possuem um padrão para o nome do arquivo, o que difuculta a inclusão de multiplos arquivos em softwares como o pgadmin, porque a inlusão induvidual de cada um deles se torna inviavel e scripts para a inclusão de diversos arquivos precisam de um padrão no nome dos arquivos. Isso dificulou muito as analises de tempos maiores, nos obrigando a escolher amostrar muito menores por causa da quantidade de problemas que teriamos ao escolher uma base maior. 

No entanto, vale ressaltar que ainda assim, um dos motivos de escolha dessa base foi a boa interface de visualização dos dados, a maioria dos outros órgãos públicos, falham em explicar o que é os dados apresentados e tivemos acesso a muitas tabelas que não sabíamos do que se tratavam. Por isso, embora a apresentação dos dados da PBH não esteja totalmente completos, no que diz respeito a dicionário de dados, descrições e qualidade da coleta e apresentação, é importante ressaltar que dos dados publicos analisados pelo grupo, a base da prefeitura tem a melhor descrição de seus dados em comparação com outros orgãos. E poucos apresentam dados nulos, então as amostras pareceram mais confiaveis para nós. 

## 8. Esquema Conceitual

## 9. Dicionário de dados: 




