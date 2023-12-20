# Objetivos
```markdown

1.1) Corrigir Divergência de valor no gráfico de faturamento por evolução e a tabela - Período filtrado: 01/11/2023 a 30/11/2023.
1.2) Tornar  apresentáveis, as legendas de todos os gráficos de "Faturamento". Talvez usar legendas seja uma opção.
1.3)    O gráficos de faturamento devem restringir a informação ao tipo de produto selecionado no nível principal
        Exemplo, usuário seleciona o TIPO água e clica no no gráfico de faturamento, então será exibido análises filtradas pelo tipo água
        Exemplo, usuário seleciona o TIPO TODOS e clica no no gráfico de faturamento, então será exibido análises filtradas pelo tipo TODOS
        Exemplo, usuário seleciona o produto e clica no gráfico de faturamento por produto, então será exibido análises filtradas pelo produto

1.5)    Auditoria das origens do ICMS
        Criamos a auditoria dos valores de ICMS, porém o gestor precisa do resultado macro, por regra
        O nível atual, que apresenta o resultado de forma análitica por nota pode ser mantido como um nível inferior ao nível macro
        A demanda é, ao clicar sobre o item "ICMS", deve-se abrir um nível macro, que apresente as regras de ICMS do GM, o valor de ICMS efetivo (com beneficio), o valor de ICMS sem benefício e a diferença
        O gestor identificou uma divergência no cálculo do benefício atual, pois a UF origem deve ser considerada e aparentemente não está. 
        Um exemplo são as vendas originadas da unidade de GO, elas não tem benefício, porém o dash apresenta que tem.
        Auditoria das origens de todos os impostos
        Assim como o ICMS pode ser auditado, o GM também gostaria de possibilitar auditar os demais impostos

1.6)Criar um nível para ser acessado a partir do cliente no componente de LUCRO/PREJUIZO dos gráficos de rentabilidade (por tipo e por produto)
        Apresentar as despesas que foram pagas com o lucro
        Essas despesas são obtidas da mesma forma que o custo fixo, porém com a classificação de naturezas diferentes de (I-Indireto e F-Fixo); 
        Naturezas não classificadas também devem ser consideradas. Usar o nível do custo fixo como modelo.
```
     
### 1. Log's Execução
#### 1.1. 18/12/2023 07:00 as 08:20
```markdown
Corrigido Divergência de valor no gráfico de faturamento por evolução e a tabela - Período filtrado: 01/11/2023 a 30/11/2023.
```
#### 1.2. 18/12/2023 08:20 as 9:00
```markdown
Inclusão de legendas em graficos de pizza do faturamento.
```
#### 1.3. 18/12/2023 09:00 as 11:20
```markdown
Atualizamos os gráficos de faturamento para restringir as informações ao tipo de produto selecionado no nível principal. Agora, ao escolher um tipo específico, você verá análises filtradas exclusivamente por esse tipo. Se optar por "Todos" no campo de tipo, as análises exibidas serão filtradas para abranger todos os tipos disponíveis. Da mesma forma, ao selecionar um produto específico, as análises serão filtradas para fornecer informações específicas desse produto.

```
#### 1.3. 18/12/2023 12:20 as 17:10
```markdown
Atualizamos os gráficos de faturamento para restringir as informações Da mesma forma, ao selecionar um produto específico, as análises serão filtradas para fornecer informações específicas desse produto.

```
#### 1.5. 19/12/2023 07:00 as 11:30
```markdown
GM - Custo x Rentabilidade - Controle de qualidade - Redefinições das ações para acesso ao nivel principal e secundario do custo variavel no dashboard  de rentabilidade.
```

#### 1.5. 19/12/2023 14:00 as 17:50
```markdown

GM - Custo x Rentabilidade - Controle de qualidade - Aprimorei o cálculo do benefício fiscal no SELECT exclusivamente para notas originárias de 'MG'. Além disso, realizei uma expansão no detalhamento do custo variável, incorporando um componente de tabela na parte inferior, cuja atualização é acionada por meio de um clique no componente de tabela superior.
```

#### 1.5. 20/12/2023 07:00 as 12:00
```markdown

GM - Custo x Rentabilidade - Controle de qualidade - Desenvolvimento de um componente de tabela de nível secundário, destinado a aprimorar a visualização e análise dos valores brutos e líquidos do ICMS, organizados de forma agrupada conforme o tipo de benefício associado. Este componente visa oferecer uma abordagem mais detalhada e eficiente para a apresentação das informações, proporcionando uma compreensão mais aprofundada dos dados relacionados ao ICMS.
```

#### 1.5. 20/12/2023 13:00 as 12:00