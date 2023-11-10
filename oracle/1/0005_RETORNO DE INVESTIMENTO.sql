WITH TOT AS (
    SELECT TO_CHAR(CAB.dtmov, 'MM/YYYY') AS MES_ANO_VENDA,
           SUM(
               CASE
                   WHEN CAB.tipmov = 'D' THEN (ITE.vlrtot - ITE.vlrdesc - ITE.vlrrepred) * -1
                   ELSE (ITE.vlrtot - ITE.vlrdesc - ITE.vlrrepred)
               END
           ) AS FaturamentoMensal
    FROM tsiemp EMP
    INNER JOIN tgfcab CAB ON EMP.codemp = CAB.codemp
    INNER JOIN tgfite ITE ON CAB.nunota = ITE.nunota
    INNER JOIN TGFPRO PRO ON PRO.CODPROD = ITE.CODPROD
    INNER JOIN tgftop TOP ON CAB.codtipoper = TOP.codtipoper AND CAB.dhtipoper = TOP.dhalter
    WHERE TOP.atualest <> 'N'
    AND CAB.tipmov IN ('V', 'D')
    AND CAB.statusnota = 'L'
    AND (CAB.statusnfe = 'A' OR CAB.statusnfe = 'T' OR CAB.statusnfe IS NULL)
    AND ((TOP.atualfin <> 0 AND TOP.tipatualfin = 'I') OR TOP.codtipoper IN (1112, 1113))
    /*AND PRO.MARCA IN (SELECT MARCA FROM TGFPRO WHERE CODPROD IN (SELECT CODMARCA FROM AD_GRUMARCAITE WHERE CODGRU IN :P_CODGRU))*/
    AND PRO.MARCA IN (SELECT MARCA FROM TGFPRO WHERE CODPROD IN (SELECT CODMARCA FROM AD_GRUMARCAITE WHERE CODGRU IN :P_CODGRU ))
	AND   ((CAB.dtmov >= :P_PERIODO.INI AND CAB.dtmov <= :P_PERIODO.FIN)
 	OR (:P_PERIODO.INI IS NULL AND :P_PERIODO.FIN IS NULL)) 

    GROUP BY TO_CHAR(CAB.dtmov, 'MM/YYYY')


),


TOT2 AS (SELECT TOT.MES_ANO_VENDA,
       TOT.FaturamentoMensal FatMensal,
       SUM(TOT.FaturamentoMensal) OVER (ORDER BY TO_DATE(TOT.MES_ANO_VENDA, 'MM/YYYY')) AS ACUMULADO_FatMensal
FROM TOT
ORDER BY TOT.MES_ANO_VENDA),
CUS AS (
SELECT 
  TO_CHAR(VGF.dhbaixa , 'YYYY') AS ANO,
  TO_CHAR(VGF.dhbaixa , 'MM') AS MES,
  TO_CHAR(VGF.dhbaixa , 'MM/YYYY') AS MES_ANO,
  SUM(VGF.VLRBAIXA*-1) AS CUSTO_MENSAL,
  SUM(SUM(VGF.VLRBAIXA*-1)) OVER (ORDER BY TO_CHAR(VGF.dhbaixa , 'YYYY'), TO_CHAR(VGF.dhbaixa, 'MM')) AS ACUMULADO_CUSTO_MENSAL
FROM 
  VGF_RESULTADO_SATIS VGF
  INNER JOIN TSICUS CUS ON CUS.CODCENCUS = VGF.CODCENCUS
WHERE
  ((VGF.dhbaixa >= :P_PERIODO.INI AND VGF.dhbaixa <= :P_PERIODO.FIN)
 	OR (:P_PERIODO.INI IS NULL AND :P_PERIODO.FIN IS NULL)) 
  AND VGF.CODCENCUS LIKE '7%' 
  AND CUS.DESCRCENCUS NOT LIKE '%QUALIDADE%'
GROUP BY
  TO_CHAR(VGF.dhbaixa , 'YYYY'),
  TO_CHAR(VGF.dhbaixa , 'MM'),
  TO_CHAR(VGF.dhbaixa , 'MM/YYYY')
ORDER BY ANO, MES
)




SELECT
TOT2.MES_ANO_VENDA,
TOT2.FATMENSAL / CUS.CUSTO_MENSAL                     AS MENSAL_CUS_X_VEN,
TOT2.ACUMULADO_FATMENSAL / CUS.ACUMULADO_CUSTO_MENSAL AS ACUMULADO_MENSAL_CUS_X_VEN
FROM TOT2
INNER JOIN CUS ON TOT2.MES_ANO_VENDA = CUS.MES_ANO	