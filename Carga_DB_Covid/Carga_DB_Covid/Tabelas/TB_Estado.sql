CREATE TABLE [dbo].[TB_Estado]
(
	[Cod_Estado] NVARCHAR(2) NOT NULL PRIMARY KEY, 
    [Desc_Estado] NVARCHAR(50) NOT NULL, 
    [Cod_Regiao] NVARCHAR(1) NULL, 
    CONSTRAINT [FK_TB_Estado_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [TB_Regiao]([Cod_Regiao])
)
