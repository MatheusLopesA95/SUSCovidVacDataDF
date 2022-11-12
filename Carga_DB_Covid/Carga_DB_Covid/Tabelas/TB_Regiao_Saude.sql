CREATE TABLE [dbo].[TB_Regiao_Saude]
(
	[Cod_Regiao_Saude] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [Desc_Reg_Saude] NVARCHAR(200) NULL, 
    [Cod_Estado] NVARCHAR(2) NOT NULL, 
    [Cod_Munincipio] NVARCHAR(50) NOT NULL, 
    [Cod_Regiao] NVARCHAR NOT NULL, 
    CONSTRAINT [FK_TB_Regiao_Saude_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [TB_Estado]([Cod_Estado]), 
    CONSTRAINT [FK_TB_Regiao_Saude_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [TB_Munincipio]([Cod_Munincipio]), 
    CONSTRAINT [FK_TB_Regiao_Saude_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [TB_Regiao]([Cod_Regiao])
)
