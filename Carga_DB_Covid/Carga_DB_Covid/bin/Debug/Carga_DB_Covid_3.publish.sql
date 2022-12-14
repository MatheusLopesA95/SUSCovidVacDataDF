/*
Deployment script for Covid_DB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Covid_DB"
:setvar DefaultFilePrefix "Covid_DB"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Rename refactoring operation with key f6b12da2-9037-4ac3-9bb5-fc3179438afd, 327baae4-3ab2-4280-a145-d37548f332bb is skipped, element [dbo].[TB_Regiao_Saude].[Id] (SqlSimpleColumn) will not be renamed to Cod_Regiao_Saude';


GO
PRINT N'Rename refactoring operation with key b7d2e41c-6dbf-44ed-aba5-eaa66e348474 is skipped, element [dbo].[TB_Regiao_Saude].[Cod_Mun] (SqlSimpleColumn) will not be renamed to Cod_Munincipio';


GO
PRINT N'Rename refactoring operation with key 74e706f7-a72d-4813-8863-8f0386059586 is skipped, element [dbo].[TB_Rel_Casos].[Id] (SqlSimpleColumn) will not be renamed to Cod_Estado';


GO
PRINT N'Rename refactoring operation with key f2a016d2-5959-4520-835d-83e36039dc26 is skipped, element [dbo].[Rel_Obitos].[Casos_Novos] (SqlSimpleColumn) will not be renamed to Obitos_Novos';


GO
PRINT N'Rename refactoring operation with key 4a1bb36b-7135-4c5f-9099-61223747e4b2 is skipped, element [dbo].[Rel_Recuperados].[Casos_Novos] (SqlSimpleColumn) will not be renamed to Recuperados';


GO
PRINT N'Rename refactoring operation with key a6887af1-8d99-4a27-a6e9-e47e952d3664 is skipped, element [dbo].[TB_Acompanhamento].[Casos_Novos] (SqlSimpleColumn) will not be renamed to Acompanhamento_Novos';


GO
PRINT N'Rename refactoring operation with key a94d068c-7cf6-4587-8e4b-df9c11d71018 is skipped, element [dbo].[FK_TB_Rel_Casos_TB_Estado] (SqlForeignKeyConstraint) will not be renamed to [FK_TB_Rel_Recuperados_TB_Estado]';


GO
PRINT N'Rename refactoring operation with key df621933-a86e-44e3-b7b0-8bf28c252cae is skipped, element [dbo].[FK_TB_Rel_Casos_TB_Munincipio] (SqlForeignKeyConstraint) will not be renamed to [FK_TB_Rel_Recuperados_TB_Munincipio]';


GO
PRINT N'Dropping Foreign Key [dbo].[FK_TB_Estado_TB_Regiao]...';


GO
ALTER TABLE [dbo].[TB_Estado] DROP CONSTRAINT [FK_TB_Estado_TB_Regiao];


GO
PRINT N'Altering Table [dbo].[TB_Estado]...';


GO
ALTER TABLE [dbo].[TB_Estado] ALTER COLUMN [Cod_Regiao] NVARCHAR (1) NULL;


GO
PRINT N'Creating Table [dbo].[Rel_Obitos]...';


GO
CREATE TABLE [dbo].[Rel_Obitos] (
    [Cod_Estado]       NVARCHAR (2)  NOT NULL,
    [Cod_Munincipio]   NVARCHAR (50) NULL,
    [Cod_Regiao]       NVARCHAR (1)  NULL,
    [Cod_Regiao_Saude] NVARCHAR (50) NULL,
    [Obitos_Novos]     INT           NOT NULL,
    [Data]             DATE          NOT NULL
);


GO
PRINT N'Creating Table [dbo].[Rel_Recuperados]...';


GO
CREATE TABLE [dbo].[Rel_Recuperados] (
    [Cod_Estado]       NVARCHAR (2)  NOT NULL,
    [Cod_Munincipio]   NVARCHAR (50) NULL,
    [Cod_Regiao]       NVARCHAR (1)  NULL,
    [Cod_Regiao_Saude] NVARCHAR (50) NULL,
    [Recuperados]      INT           NOT NULL,
    [Data]             DATE          NOT NULL
);


GO
PRINT N'Creating Table [dbo].[TB_Acompanhamento]...';


GO
CREATE TABLE [dbo].[TB_Acompanhamento] (
    [Cod_Estado]           NVARCHAR (2)  NOT NULL,
    [Cod_Munincipio]       NVARCHAR (50) NULL,
    [Cod_Regiao]           NVARCHAR (1)  NULL,
    [Cod_Regiao_Saude]     NVARCHAR (50) NULL,
    [Acompanhamento_Novos] INT           NOT NULL,
    [Data]                 DATE          NOT NULL
);


GO
PRINT N'Creating Table [dbo].[TB_Regiao_Saude]...';


GO
CREATE TABLE [dbo].[TB_Regiao_Saude] (
    [Cod_Regiao_Saude] NVARCHAR (50)  NOT NULL,
    [Desc_Reg_Saude]   NVARCHAR (200) NOT NULL,
    [Cod_Estado]       NVARCHAR (2)   NOT NULL,
    [Cod_Munincipio]   NVARCHAR (50)  NOT NULL,
    [Cod_Regiao]       NVARCHAR (1)   NOT NULL,
    PRIMARY KEY CLUSTERED ([Cod_Regiao_Saude] ASC)
);


GO
PRINT N'Creating Table [dbo].[TB_Rel_Casos]...';


GO
CREATE TABLE [dbo].[TB_Rel_Casos] (
    [Cod_Estado]       NVARCHAR (2)  NOT NULL,
    [Cod_Munincipio]   NVARCHAR (50) NULL,
    [Cod_Regiao]       NVARCHAR (1)  NULL,
    [Cod_Regiao_Saude] NVARCHAR (50) NULL,
    [Casos_Novos]      INT           NOT NULL,
    [Data]             DATE          NOT NULL
);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Estado_TB_Regiao]...';


GO
ALTER TABLE [dbo].[TB_Estado] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Estado_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [dbo].[TB_Regiao] ([Cod_Regiao]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Obitos_TB_Estado]...';


GO
ALTER TABLE [dbo].[Rel_Obitos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Obitos_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [dbo].[TB_Estado] ([Cod_Estado]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Obitos_TB_Munincipio]...';


GO
ALTER TABLE [dbo].[Rel_Obitos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Obitos_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [dbo].[TB_Munincipio] ([Cod_Munincipio]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Obitos_TB_Regiao]...';


GO
ALTER TABLE [dbo].[Rel_Obitos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Obitos_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [dbo].[TB_Regiao] ([Cod_Regiao]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Obitos_TB_Regiao_Saude]...';


GO
ALTER TABLE [dbo].[Rel_Obitos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Obitos_TB_Regiao_Saude] FOREIGN KEY ([Cod_Regiao_Saude]) REFERENCES [dbo].[TB_Regiao_Saude] ([Cod_Regiao_Saude]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Recuperados_TB_Estado]...';


GO
ALTER TABLE [dbo].[Rel_Recuperados] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Recuperados_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [dbo].[TB_Estado] ([Cod_Estado]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Recuperados_TB_Munincipio]...';


GO
ALTER TABLE [dbo].[Rel_Recuperados] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Recuperados_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [dbo].[TB_Munincipio] ([Cod_Munincipio]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Recuperados_TB_Regiao]...';


GO
ALTER TABLE [dbo].[Rel_Recuperados] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Recuperados_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [dbo].[TB_Regiao] ([Cod_Regiao]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Recuperados_TB_Regiao_Saude]...';


GO
ALTER TABLE [dbo].[Rel_Recuperados] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Recuperados_TB_Regiao_Saude] FOREIGN KEY ([Cod_Regiao_Saude]) REFERENCES [dbo].[TB_Regiao_Saude] ([Cod_Regiao_Saude]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Acompanhamento_TB_Estado]...';


GO
ALTER TABLE [dbo].[TB_Acompanhamento] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Acompanhamento_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [dbo].[TB_Estado] ([Cod_Estado]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Acompanhamento_TB_Munincipio]...';


GO
ALTER TABLE [dbo].[TB_Acompanhamento] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Acompanhamento_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [dbo].[TB_Munincipio] ([Cod_Munincipio]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Acompanhamento_TB_Regiao]...';


GO
ALTER TABLE [dbo].[TB_Acompanhamento] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Acompanhamento_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [dbo].[TB_Regiao] ([Cod_Regiao]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Acompanhamento_TB_Regiao_Saude]...';


GO
ALTER TABLE [dbo].[TB_Acompanhamento] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Acompanhamento_TB_Regiao_Saude] FOREIGN KEY ([Cod_Regiao_Saude]) REFERENCES [dbo].[TB_Regiao_Saude] ([Cod_Regiao_Saude]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Regiao_Saude_TB_Estado]...';


GO
ALTER TABLE [dbo].[TB_Regiao_Saude] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Regiao_Saude_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [dbo].[TB_Estado] ([Cod_Estado]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Regiao_Saude_TB_Munincipio]...';


GO
ALTER TABLE [dbo].[TB_Regiao_Saude] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Regiao_Saude_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [dbo].[TB_Munincipio] ([Cod_Munincipio]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Regiao_Saude_TB_Regiao]...';


GO
ALTER TABLE [dbo].[TB_Regiao_Saude] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Regiao_Saude_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [dbo].[TB_Regiao] ([Cod_Regiao]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Rel_Casos_TB_Estado]...';


GO
ALTER TABLE [dbo].[TB_Rel_Casos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Rel_Casos_TB_Estado] FOREIGN KEY ([Cod_Estado]) REFERENCES [dbo].[TB_Estado] ([Cod_Estado]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Rel_Casos_TB_Munincipio]...';


GO
ALTER TABLE [dbo].[TB_Rel_Casos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Rel_Casos_TB_Munincipio] FOREIGN KEY ([Cod_Munincipio]) REFERENCES [dbo].[TB_Munincipio] ([Cod_Munincipio]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Rel_Casos_TB_Regiao]...';


GO
ALTER TABLE [dbo].[TB_Rel_Casos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Rel_Casos_TB_Regiao] FOREIGN KEY ([Cod_Regiao]) REFERENCES [dbo].[TB_Regiao] ([Cod_Regiao]);


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Rel_Casos_TB_Regiao_Saude]...';


GO
ALTER TABLE [dbo].[TB_Rel_Casos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Rel_Casos_TB_Regiao_Saude] FOREIGN KEY ([Cod_Regiao_Saude]) REFERENCES [dbo].[TB_Regiao_Saude] ([Cod_Regiao_Saude]);


GO
-- Refactoring step to update target server with deployed transaction logs
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f6b12da2-9037-4ac3-9bb5-fc3179438afd')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f6b12da2-9037-4ac3-9bb5-fc3179438afd')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b7d2e41c-6dbf-44ed-aba5-eaa66e348474')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b7d2e41c-6dbf-44ed-aba5-eaa66e348474')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '74e706f7-a72d-4813-8863-8f0386059586')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('74e706f7-a72d-4813-8863-8f0386059586')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'f2a016d2-5959-4520-835d-83e36039dc26')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('f2a016d2-5959-4520-835d-83e36039dc26')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '4a1bb36b-7135-4c5f-9099-61223747e4b2')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('4a1bb36b-7135-4c5f-9099-61223747e4b2')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a6887af1-8d99-4a27-a6e9-e47e952d3664')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a6887af1-8d99-4a27-a6e9-e47e952d3664')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a94d068c-7cf6-4587-8e4b-df9c11d71018')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a94d068c-7cf6-4587-8e4b-df9c11d71018')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'df621933-a86e-44e3-b7b0-8bf28c252cae')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('df621933-a86e-44e3-b7b0-8bf28c252cae')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '327baae4-3ab2-4280-a145-d37548f332bb')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('327baae4-3ab2-4280-a145-d37548f332bb')

GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[TB_Estado] WITH CHECK CHECK CONSTRAINT [FK_TB_Estado_TB_Regiao];

ALTER TABLE [dbo].[Rel_Obitos] WITH CHECK CHECK CONSTRAINT [FK_TB_Obitos_TB_Estado];

ALTER TABLE [dbo].[Rel_Obitos] WITH CHECK CHECK CONSTRAINT [FK_TB_Obitos_TB_Munincipio];

ALTER TABLE [dbo].[Rel_Obitos] WITH CHECK CHECK CONSTRAINT [FK_TB_Obitos_TB_Regiao];

ALTER TABLE [dbo].[Rel_Obitos] WITH CHECK CHECK CONSTRAINT [FK_TB_Obitos_TB_Regiao_Saude];

ALTER TABLE [dbo].[Rel_Recuperados] WITH CHECK CHECK CONSTRAINT [FK_TB_Recuperados_TB_Estado];

ALTER TABLE [dbo].[Rel_Recuperados] WITH CHECK CHECK CONSTRAINT [FK_TB_Recuperados_TB_Munincipio];

ALTER TABLE [dbo].[Rel_Recuperados] WITH CHECK CHECK CONSTRAINT [FK_TB_Recuperados_TB_Regiao];

ALTER TABLE [dbo].[Rel_Recuperados] WITH CHECK CHECK CONSTRAINT [FK_TB_Recuperados_TB_Regiao_Saude];

ALTER TABLE [dbo].[TB_Acompanhamento] WITH CHECK CHECK CONSTRAINT [FK_TB_Acompanhamento_TB_Estado];

ALTER TABLE [dbo].[TB_Acompanhamento] WITH CHECK CHECK CONSTRAINT [FK_TB_Acompanhamento_TB_Munincipio];

ALTER TABLE [dbo].[TB_Acompanhamento] WITH CHECK CHECK CONSTRAINT [FK_TB_Acompanhamento_TB_Regiao];

ALTER TABLE [dbo].[TB_Acompanhamento] WITH CHECK CHECK CONSTRAINT [FK_TB_Acompanhamento_TB_Regiao_Saude];

ALTER TABLE [dbo].[TB_Regiao_Saude] WITH CHECK CHECK CONSTRAINT [FK_TB_Regiao_Saude_TB_Estado];

ALTER TABLE [dbo].[TB_Regiao_Saude] WITH CHECK CHECK CONSTRAINT [FK_TB_Regiao_Saude_TB_Munincipio];

ALTER TABLE [dbo].[TB_Regiao_Saude] WITH CHECK CHECK CONSTRAINT [FK_TB_Regiao_Saude_TB_Regiao];

ALTER TABLE [dbo].[TB_Rel_Casos] WITH CHECK CHECK CONSTRAINT [FK_TB_Rel_Casos_TB_Estado];

ALTER TABLE [dbo].[TB_Rel_Casos] WITH CHECK CHECK CONSTRAINT [FK_TB_Rel_Casos_TB_Munincipio];

ALTER TABLE [dbo].[TB_Rel_Casos] WITH CHECK CHECK CONSTRAINT [FK_TB_Rel_Casos_TB_Regiao];

ALTER TABLE [dbo].[TB_Rel_Casos] WITH CHECK CHECK CONSTRAINT [FK_TB_Rel_Casos_TB_Regiao_Saude];


GO
PRINT N'Update complete.';


GO
