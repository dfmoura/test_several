# Objetivos
O objetivo principal é desenvolver um dashboard dedicado à análise de vendas.

## História do Processo
O processo de desenvolvimento do dashboard para análise de vendas é delineado da seguinte maneira:

## Solução Proposta
A proposta consiste em criar um dashboard que integre diversas análises de vendas, com os seguintes componentes:

### 1. Filtros
1.1. Diversos filtros serão implementados conforme a necessidade do cliente, inicialmente incluindo:
   - Período de Negociação
   - Cliente
   - TOP de Venda (seleção múltipla)

### 2. Nível Principal do Dashboard
#### 2.1. Painel Superior
   - Gráfico de colunas por período (mês)
     - Para cada mês, serão geradas 3 colunas, representando:
       - Qtd. Notas Aprovadas
       - Qtd. Notas Recebidas (baixadas)
       - Qtd. Notas Em Aberto
     - Clicar nas colunas atualizará o painel inferior do dashboard.

#### 2.2. Painel Inferior
   - Gráfico de pizza com as formas de pagamento:
     - O resultado varia conforme a coluna e mês que o usuário clicou, apresentando as formas de pagamento das colunas de "Notas Aprovadas", "Notas Recebidas" e "Notas Aberto."
   - Gráfico de pizza de recebimento por quantidade:
     - O resultado varia conforme o mês da coluna selecionada, mostrando a quantidade de notas baixadas durante o período.
   - Gráfico de pizza de recebimento por valor:
     - O resultado varia conforme o mês da coluna selecionada, exibindo o valor total recebido (baixado) durante o período.
   - Clicar nas fatias dos gráficos de pizza levará o usuário ao segundo nível de auditoria, que apresenta todas as notas e todos os financeiros associados ao valor exibido pela fatia.

### 3. Segundo Nível do Dashboard
#### 3.1. Painel Superior
   - Tabela de notas
     - Apresenta as notas em detalhe
     - Duplo clique abre a nota na tela "Central de Vendas"

#### 3.2. Painel Inferior
   - Tabela de financeiros
     - Apresenta os financeiros em detalhe
     - Duplo clique abre o financeiro na tela "Movimentação Financeira"