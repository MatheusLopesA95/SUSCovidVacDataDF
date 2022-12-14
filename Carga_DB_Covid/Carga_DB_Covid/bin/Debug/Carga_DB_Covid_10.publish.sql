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
PRINT N'Dropping Foreign Key [dbo].[FK_TB_Rel_Casos_Dim_Tempo]...';


GO
ALTER TABLE [dbo].[TB_Rel_Casos] DROP CONSTRAINT [FK_TB_Rel_Casos_Dim_Tempo];


GO
PRINT N'Altering Table [dbo].[TB_Rel_Casos]...';


GO
ALTER TABLE [dbo].[TB_Rel_Casos] ALTER COLUMN [Casos_Novos] INT NULL;

ALTER TABLE [dbo].[TB_Rel_Casos] ALTER COLUMN [Cod_Dia] NVARCHAR (50) NULL;


GO
PRINT N'Creating Foreign Key [dbo].[FK_TB_Rel_Casos_Dim_Tempo]...';


GO
ALTER TABLE [dbo].[TB_Rel_Casos] WITH NOCHECK
    ADD CONSTRAINT [FK_TB_Rel_Casos_Dim_Tempo] FOREIGN KEY ([Cod_Dia]) REFERENCES [dbo].[Dim_Tempo] ([Cod_Dia]);


GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[TB_Rel_Casos] WITH CHECK CHECK CONSTRAINT [FK_TB_Rel_Casos_Dim_Tempo];


GO
PRINT N'Update complete.';


GO
