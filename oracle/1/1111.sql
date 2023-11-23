SELECT
CAB.NUNOTA
,CAB.VLRNOTA AS VLRNOTA
,SUM(ITE.QTDNEG) AS QTDNEG
,SUM((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) AS VLRFAT
,CAB.VLRNOTA - SUM((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) AS DIF,
SUM(ITE.QTDNEG * ITE.VLRUNIT) AS VLRTOT, SUM(ITE.VLRDESC) AS VLRDESC, SUM(ITE.VLRIPI) AS VLRIPI, SUM(ITE.VLRSUBST) AS VLRSUBST
FROM TGFCAB CAB
INNER JOIN TGFITE ITE ON CAB.NUNOTA = ITE.NUNOTA
INNER JOIN TGFPRO PRO ON ITE.CODPROD = PRO.CODPROD
INNER JOIN TGFTOP TOP ON CAB.CODTIPOPER = TOP.CODTIPOPER AND TOP.DHALTER = (SELECT MAX(DHALTER) FROM TGFTOP WHERE CODTIPOPER = CAB.CODTIPOPER)
WHERE
TOP.GOLSINAL = -1
AND CAB.DTNEG BETWEEN '01-11-2022' AND '21-11-2023'
AND TOP.TIPMOV IN ('V','D')
AND TOP.ATIVO = 'S'
AND CAB.NUNOTA = 6267769
AND PRO.AD_TPPROD IS NOT NULL
GROUP BY CAB.NUNOTA, CAB.VLRNOTA
HAVING CAB.VLRNOTA - SUM((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) > 1
ORDER BY 4 desc


SELECT
ITE.NUNOTA,
SUM(DISTINCT
CASE WHEN CAB.TIPMOV = 'D' THEN  CAB.VLRNOTA * -1
else CAB.VLRNOTA END) AS VLRNOTA,
SUM(
CASE WHEN CAB.TIPMOV = 'D' THEN ((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) * -1 
else ((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) END) AS VLRFAT,
SUM(DISTINCT
CASE WHEN CAB.TIPMOV = 'D' THEN  CAB.VLRNOTA * -1
else CAB.VLRNOTA END) - 
SUM(
CASE WHEN CAB.TIPMOV = 'D' THEN ((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) * -1 
else ((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) END) AS DIF
FROM TGFCAB CAB
INNER JOIN TGFITE ITE ON CAB.NUNOTA = ITE.NUNOTA
INNER JOIN TGFPRO PRO ON ITE.CODPROD = PRO.CODPROD
INNER JOIN TGFTOP TOP ON CAB.CODTIPOPER = TOP.CODTIPOPER AND TOP.DHALTER = (SELECT MAX(DHALTER) FROM TGFTOP WHERE CODTIPOPER = CAB.CODTIPOPER)
WHERE
TOP.GOLSINAL = -1
AND CAB.DTNEG BETWEEN '21-11-2023' AND '21-11-2023'
AND TOP.TIPMOV IN ('V','D')
AND TOP.ATIVO = 'S'
--AND CAB.NUNOTA = 7549577
AND PRO.AD_TPPROD IS NOT NULL
GROUP BY ITE.NUNOTA
ORDER BY 1




SELECT
CAB.NUNOTA,
SUM(DISTINCT
CASE 
WHEN CAB.TIPMOV = 'D' THEN  CAB.VLRNOTA * -1
WHEN CAB.TIPMOV = 'V' THEN  CAB.VLRNOTA
END
) AS VLRNOTA
FROM TGFCAB CAB
INNER JOIN TGFTOP TOP ON CAB.CODTIPOPER = TOP.CODTIPOPER
WHERE
TOP.GOLSINAL = -1
AND CAB.DTNEG BETWEEN '21-11-2023' AND '21-11-2023'
AND TOP.TIPMOV IN ('V','D')
AND TOP.ATIVO = 'S'
AND CAB.NUNOTA = 7549577
GROUP BY CAB.NUNOTA
ORDER BY 1


SELECT
ITE.NUNOTA,
SUM(DISTINCT
CASE 
WHEN CAB.TIPMOV = 'D' THEN ((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) * -1 
WHEN CAB.TIPMOV = 'V' THEN ((ITE.QTDNEG * ITE.VLRUNIT) - ITE.VLRDESC + ITE.VLRIPI + ITE.VLRSUBST) ELSE 0
END
) AS VLRFAT
FROM TGFCAB CAB
INNER JOIN TGFITE ITE ON CAB.NUNOTA = ITE.NUNOTA
INNER JOIN TGFPRO PRO ON ITE.CODPROD = PRO.CODPROD
INNER JOIN TGFTOP TOP ON CAB.CODTIPOPER = TOP.CODTIPOPER
WHERE
TOP.GOLSINAL = -1
AND CAB.DTNEG BETWEEN '21-11-2023' AND '21-11-2023'
AND TOP.TIPMOV IN ('V','D')
AND TOP.ATIVO = 'S'
AND CAB.NUNOTA = 7549577
AND PRO.AD_TPPROD IS NOT NULL
GROUP BY ITE.NUNOTA
ORDER BY 1