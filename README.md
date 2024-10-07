# Banco de Dados OdontoClin

Este repositório contém o projeto de um banco de dados desenvolvido em MySQL para a gestão de uma clínica odontológica fictícia chamada OdontoClin. O sistema foi criado como parte de um trabalho acadêmico, visando simular a gestão de dados de pacientes, dentistas, atendentes, tratamentos, e consultas.

## Sobre o Projeto

O banco de dados OdontoClin permite gerenciar:

- Pacientes: Cadastro de informações pessoais, plano de saúde e alergias.
- Dentistas: Registro dos profissionais com especialidades e contatos.
- Atendentes: Informações sobre os atendentes da clínica.
- Tratamentos: Tipos de tratamentos oferecidos e seus preços.
- Consultas: Agendamentos de consultas entre pacientes, dentistas e atendentes.
- Prontuários: Histórico dos diagnósticos, tratamentos realizados e observações médicas.
- Consultórios: Equipamentos disponíveis e o status de cada consultório.

## Estrutura do Banco de Dados

- **Arquivo principal:** bancodedadosodontoclin.sql
- **Tabelas criadas:**
- tb_paciente
- tb_dentista
- tb_tratamento
- tb_prontuario
- tb_atendente
- tb_consulta
- tb_consultorio

## Pré-requisitos

- MySQL instalado na máquina.
- Um ambiente de desenvolvimento como MySQL Workbench, DBeaver, ou outro cliente SQL.

## Como Executar o Projeto

1. Clone o repositório
```bash
git clone https://github.com/joaopedroffs/banco-de-dados-odontoclin.git
```
2. Importe o arquivo *bancodedadosodontoclin.sql* para o seu ambiente MySQL.
3. Execute os comandos para criar o banco de dados e as tabelas.
4. Popule as tabelas com os dados iniciais fornecidos no arquivo.

## Consultas e Views

O arquivo .sql também inclui exemplos de:

**Consultas para listar tratamentos, pacientes e consultas realizadas. As consultas abrangem:**
- Contagem de pacientes por gênero.
- Listagem de tratamentos complexos e simples.
- Relatório de consultas com informações detalhadas dos tratamentos e dentistas envolvidos.
**Views criadas para facilitar a visualização de informações:**
- *vw_preco:* Exibe o preço médio dos tratamentos por tipo.
- *vw_alergias:* Lista os pacientes com suas respectivas alergias.
- *vw_registro_de_consultas:* Mostra as informações detalhadas de cada consulta realizada.

## Licença
Este projeto é de uso acadêmico e pode ser utilizado para aprendizado e referência.
