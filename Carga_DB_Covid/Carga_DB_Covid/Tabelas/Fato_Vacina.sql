CREATE TABLE [dbo].[Dim_Vacina]
(
	[Cod_Estado] NVARCHAR(2) NULL , 
    [Cod_Munincipio] NVARCHAR(50) NULL, 
    [Cod_Regiao] NVARCHAR NULL, 
    [Vacinas] INT NOT NULL, 
    [Cod_Dia] NVARCHAR(50) NULL, 
    CONSTRAINT [FK_TB_Vacina_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [Dim_Estado]([Cod_Estado]), 
    CONSTRAINT [FK_TB_Vacina_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [Dim_Munincipio]([Cod_Munincipio]), 
    CONSTRAINT [FK_TB_Vacina_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [Dim_Regiao]([Cod_Regiao]), 
    CONSTRAINT [FK_TB_Vacina_Dim_Tempo] FOREIGN KEY ([Cod_Dia]) REFERENCES [Dim_Tempo]([Cod_Dia])
)