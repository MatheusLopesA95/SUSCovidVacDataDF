CREATE TABLE [dbo].[Rel_Obitos]
(
	[Cod_Estado] NVARCHAR(2) NOT NULL , 
    [Cod_Munincipio] NVARCHAR(50) NULL, 
    [Cod_Regiao] NVARCHAR NULL, 
    [Cod_Regiao_Saude] NVARCHAR(50) NULL, 
    [Obitos_Novos] INT NOT NULL, 
    [Data] DATE NOT NULL, 
    CONSTRAINT [FK_TB_Obitos_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [TB_Estado]([Cod_Estado]), 
    CONSTRAINT [FK_TB_Obitos_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [TB_Munincipio]([Cod_Munincipio]), 
    CONSTRAINT [FK_TB_Obitos_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [TB_Regiao]([Cod_Regiao]), 
    CONSTRAINT [FK_TB_Obitos_TB_Regiao_Saude] FOREIGN KEY ([Cod_Regiao_Saude]) REFERENCES [TB_Regiao_Saude]([Cod_Regiao_Saude])
)