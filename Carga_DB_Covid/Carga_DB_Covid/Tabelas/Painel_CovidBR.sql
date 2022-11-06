CREATE TABLE [dbo].[Painel_CovidBR]
(
	[Regiao] NVARCHAR(100) NULL, 
    [Estado] NVARCHAR(100) NULL, 
    [Munincipio] NVARCHAR(100) NULL, 
    [Cod_Uf] NVARCHAR(50) NULL, 
    [Cod_Mun] NVARCHAR(50) NULL, 
    [Cod_Regiao_Saud] NVARCHAR(50) NULL, 
    [Nome_Regiao_Saude] NVARCHAR(200) NULL, 
    [Data] DATE NULL, 
    [Semana_Epidemiologica] NUMERIC NULL, 
    [Pop_TCU_2019] NUMERIC(18, 2) NULL, 
    [Casos_Acumulado] NUMERIC NULL, 
    [Casos_Novos] NUMERIC NULL, 
    [Obitos_Acumulado] NUMERIC NULL, 
    [Obitos_Novos] NUMERIC NULL, 
    [Recuperados_Novos] NUMERIC NULL, 
    [Acompanhamento_Novos] NUMERIC NULL, 
    [Interior/Metropolitana] NUMERIC NULL 
)
