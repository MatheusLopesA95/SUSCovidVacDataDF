CREATE TABLE [dbo].[TB_Rel_Casos]
(
	[Cod_Estado] NVARCHAR(2) NULL , 
    [Cod_Munincipio] NVARCHAR(50) NULL, 
    [Cod_Regiao] NVARCHAR NULL, 
    [Casos_Novos] INT NULL, 
    [Cod_Dia] NVARCHAR(50) NULL, 
    CONSTRAINT [FK_TB_Rel_Casos_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [TB_Estado]([Cod_Estado]), 
    CONSTRAINT [FK_TB_Rel_Casos_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [TB_Munincipio]([Cod_Munincipio]), 
    CONSTRAINT [FK_TB_Rel_Casos_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [TB_Regiao]([Cod_Regiao]), 
    CONSTRAINT [FK_TB_Rel_Casos_Dim_Tempo] FOREIGN KEY ([Cod_Dia]) REFERENCES [Dim_Tempo]([Cod_Dia])
)
