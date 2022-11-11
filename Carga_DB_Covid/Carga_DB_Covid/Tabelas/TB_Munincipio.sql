CREATE TABLE [dbo].[TB_Munincipio]
(
	[Cod_Munincipio] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [Desc_Munincipio] NVARCHAR(50) NOT NULL, 
    [Cod_Estado] NVARCHAR(2) NOT NULL, 
    [Cod_Regiao] NVARCHAR NOT NULL, 
    CONSTRAINT [FK_TB_Munincipio_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [TB_Estado]([Cod_Estado]), 
    CONSTRAINT [FK_TB_Munincipio_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [TB_Regiao]([Cod_Regiao])
)
